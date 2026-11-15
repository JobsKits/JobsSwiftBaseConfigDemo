//
//  JobsARKitStageView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

import UIKit
import ARKit
import SceneKit
import AVFoundation

import JobsByUIKit
import JobsSwiftBaseDefines
import SnapKit

final class JobsARKitStageView: UIView,
                               ARSCNViewDelegate,
                               ARSessionDelegate {

    var onChange: ((String, Int, Int) -> Void)?
    private(set) var selectedModel = -1
    private(set) var previewing = true
    private(set) var wantsAR = false
    private(set) var awaitingPlacement = false
    private var visible = false
    private var sessionRunning = false
    private var centerHasSurface = false
    private var lastCenterSample: TimeInterval = 0
    private var generation = 0
    private var pendingModels: [UUID: SCNNode] = [:]
    private var modelAnchors: [UUID: ARAnchor] = [:]
    private var placedModels: [SCNNode] = []
    private var modelKinds: [ObjectIdentifier: Int] = [:]
    private var planeNodes: [UUID: SCNNode] = [:]
    private var state = "guidePreviewEmpty"

    var hasModels: Bool {
        return !placedModels.isEmpty
    }
    var lastModelKind: Int? {
        return placedModels.last.flatMap { modelKinds[ObjectIdentifier($0)] }
    }
    var canPlace: Bool {
        guard (0...2).contains(selectedModel) else {
            return false
        }
        return previewing || (visible && sessionRunning && centerHasSurface && normalTracking && pendingModels.isEmpty)
    }
    private var normalTracking: Bool {
        guard let tracking = liveView.session.currentFrame?.camera.trackingState,
              case .normal = tracking else {
            return false
        }
        return true
    }
    private lazy var previewCamera: SCNCamera = {
        SCNCamera.jobsMake { _ in }
            .byARClipping(near: 0.01, far: 100)
            .byAROrthographicScale(0.2)
    }()
    private lazy var previewCameraNode: SCNNode = {
        SCNNode.jobsMake { _ in }
            .byARCamera(previewCamera)
            .byAREulerAngles(SCNVector3(-Float.pi / 4, 0, 0))
    }()
    private lazy var previewFloor: SCNNode = {
        SCNNode.jobsMake { _ in }
            .byARGeometry(SCNPlane.make(width: 0.8, height: 0.8).byARColor(UIColor(hex: "#244959")))
            .byAREulerAngles(SCNVector3(-Float.pi / 2, 0, 0))
    }()
    private lazy var previewView: SCNView = {
        SCNView.jobsMake { _ in }
            .byARCameraControl(false)
            .byARLighting(true)
            .byBackgroundColor(UIColor(hex: "#122A38"))
            .byAddTo(self) { make in
                make.edges.equalToSuperview()
            }
            .addTapAction(taps: 1) { [weak self] _ in
                self?.addPreviewModel()
            }
    }()
    private lazy var liveView: ARSCNView = {
        ARSCNView.jobsMake { _ in }
            .byARDelegate(self)
            .byARSessionDelegate(self)
            .byARScene(SCNScene.jobsMake { _ in })
            .byARLighting(true)
            .byBackgroundColor(UIColor(hex: "#122A38"))
            .byAddTo(self) { make in
                make.edges.equalToSuperview()
            }
            .addTapAction(taps: 1) { [weak self] recognizer in
                guard let self else {
                    return
                }
                self.placeOnPlane(at: recognizer.location(in: self.liveView))
            }
    }()
    private lazy var reticle: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.black.withAlphaComponent(0.65))
            .byCornerRadius(8)
            .byUserInteractionEnabled(false)
            .byAccessibilityIdentifier("jobs.arkit.reticle")
            .byAddTo(self) { make in
                make.center.equalToSuperview()
                make.size.equalTo(40)
            }
    }()
    private lazy var reticleHorizontal: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.white)
            .byAddTo(reticle) { make in
                make.center.equalToSuperview()
                make.width.equalTo(28)
                make.height.equalTo(2)
            }
    }()
    private lazy var reticleVertical: UIView = {
        UIView.jobsMake { _ in }
            .byBackgroundColor(JobsCor.white)
            .byAddTo(reticle) { make in
                make.center.equalToSuperview()
                make.width.equalTo(2)
                make.height.equalTo(28)
            }
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        byClipsToBounds().byCornerRadius(18)
        previewView.byHidden(false)
        liveView.byHidden(true)
        reticle.byHidden(true)
        reticleHorizontal.byVisible(true)
        reticleVertical.byVisible(true)
        showPreview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if previewing {
            layoutPreviewModels()
        }
    }

    @discardableResult
    func bySelectedModel(_ value: Int) -> Self {
        guard (0...2).contains(value) else {
            return self
        }
        selectedModel = value
        awaitingPlacement = true
        refreshCenterTarget()
        report(state)
        return self
    }

    func setVisible(_ value: Bool) {
        visible = value
        if !value {
            generation += 1
            centerHasSurface = false
            if sessionRunning {
                liveView.session.byARPause()
                sessionRunning = false
                reticle.byHidden(true)
                report("guidePaused")
            }
        }
    }

    func startAR() {
        guard visible else {
            return
        }
        wantsAR = true
        generation += 1
        let requestedGeneration = generation
        sessionRunning = false
        centerHasSurface = false
        liveView.session.byARPause()
        clear()
        for node in planeNodes.values {
            node.byARRemoveFromParent()
        }
        planeNodes.removeAll()
        previewing = false
        previewView.byHidden(true)
        liveView.byHidden(false)
        reticle.byHidden(true)
        guard ARWorldTrackingConfiguration.isSupported else {
            report("guideUnsupported")
            return
        }
        report("guideInitializing")
        let authorization = AVCaptureDevice.authorizationStatus(for: .video)
        if authorization == .notDetermined {
            AVCaptureDevice.requestAccess(for: .video) { [weak self] allowed in
                DispatchQueue.main.async {
                    guard let self, self.visible, self.generation == requestedGeneration else {
                        return
                    }
                    if allowed {
                        self.runAR()
                    } else {
                        self.report("guideCameraDenied")
                    }
                }
            }
        } else if authorization == .authorized {
            runAR()
        } else {
            report("guideCameraDenied")
        }
    }

    private func runAR() {
        guard visible else {
            return
        }
        sessionRunning = true
        let configuration = ARWorldTrackingConfiguration.jobsMake { _ in }
            .byARPlaneDetection(.horizontal)
        liveView.session.byARRun(configuration)
        reticle.byHidden(false)
        report("guideScanning")
    }

    func showPreview() {
        wantsAR = false
        generation += 1
        sessionRunning = false
        centerHasSurface = false
        liveView.session.byARPause()
        clear()
        for node in planeNodes.values {
            node.byARRemoveFromParent()
        }
        planeNodes.removeAll()
        previewing = true
        liveView.byHidden(true)
        reticle.byHidden(true)
        previewView
            .byHidden(false)
            .byARScene(SCNScene.jobsMake { scene in
                scene.rootNode
                    .byARAddChild(previewCameraNode)
                    .byARAddChild(previewFloor)
            })
            .byARPointOfView(previewCameraNode)
        layoutPreviewModels()
        report("guidePreviewEmpty")
    }

    func placeSelectedModel() {
        if previewing {
            addPreviewModel()
        } else if canPlace {
            placeOnPlane(at: CGPoint(x: liveView.bounds.midX, y: liveView.bounds.midY))
        } else {
            refreshCenterTarget()
            report(state)
        }
    }

    private func addPreviewModel() {
        guard previewing, (0...2).contains(selectedModel) else {
            report(state)
            return
        }
        let node = makeModel(selectedModel)
        modelKinds[ObjectIdentifier(node)] = selectedModel
        previewView.scene?.rootNode.byARAddChild(node)
        placedModels.append(node)
        awaitingPlacement = false
        layoutPreviewModels()
        report("guidePreviewReady")
    }

    private func layoutPreviewModels() {
        let columns = min(3, max(1, placedModels.count))
        let rowCount = max(1, (placedModels.count + columns - 1) / columns)
        let largestScale = max(1, placedModels.map { $0.scale.x }.max() ?? 1)
        let cellWidth = 0.24 * largestScale
        let rowDepth = 0.46 * largestScale
        let centerZ = -Float(rowCount - 1) * rowDepth / 2
        for (index, node) in placedModels.enumerated() {
            let row = index / columns
            let itemsInRow = min(columns, placedModels.count - row * columns)
            let x = (Float(index % columns) - Float(itemsInRow - 1) / 2) * cellWidth
            node.byARPosition(SCNVector3(x, 0, -Float(row) * rowDepth))
        }
        let aspect = bounds.height > 0 ? Double(bounds.width / bounds.height) : 1.3
        let width = Double(Float(columns) * cellWidth)
        let projectedHeight = Double((Float(rowCount - 1) * rowDepth + 0.46 * largestScale) / sqrt(2))
        let halfHeight = max(0.18, max(width / max(aspect, 0.3), projectedHeight) / 2) * 1.12
        previewCamera.byAROrthographicScale(halfHeight)
        previewCameraNode.byARPosition(SCNVector3(0, 1 + 0.1 * largestScale, centerZ + 1))
        previewFloor
            .byARPosition(SCNVector3(0, -0.001, centerZ))
            .byARGeometry(SCNPlane.make(width: max(0.8, CGFloat(width + 0.2)),
                                       height: max(0.8, CGFloat(Float(rowCount) * rowDepth + 0.2)))
                .byARColor(UIColor(hex: "#244959")))
    }

    private func placeOnPlane(at point: CGPoint) {
        guard visible, !previewing, sessionRunning, normalTracking,
              (0...2).contains(selectedModel), pendingModels.isEmpty else {
            report(state)
            return
        }
        guard let query = liveView.raycastQuery(from: point,
                                               allowing: .existingPlaneGeometry,
                                               alignment: .horizontal),
              let result = liveView.session.raycast(query).first else {
            centerHasSurface = false
            report("guideAim")
            return
        }
        let anchor = ARAnchor.make(transform: result.worldTransform)
        let model = makeModel(selectedModel)
        modelKinds[ObjectIdentifier(model)] = selectedModel
        pendingModels[anchor.identifier] = model
        modelAnchors[anchor.identifier] = anchor
        liveView.session.byARAddAnchor(anchor)
        report("guidePlaceReady")
    }

    private func refreshCenterTarget() {
        guard !previewing, visible, sessionRunning, normalTracking else {
            return
        }
        let point = CGPoint(x: liveView.bounds.midX, y: liveView.bounds.midY)
        let query = liveView.raycastQuery(from: point, allowing: .existingPlaneGeometry, alignment: .horizontal)
        let hit = query.flatMap { liveView.session.raycast($0).first } != nil
        let next = hit && selectedModel >= 0 && pendingModels.isEmpty
            ? "guidePlaceReady" : (planeNodes.isEmpty ? "guideScanning" : "guideAim")
        if hit != centerHasSurface || next != state {
            centerHasSurface = hit
            let color = hit ? UIColor(hex: "#53D8EB") : JobsCor.white
            reticleHorizontal.byBackgroundColor(color)
            reticleVertical.byBackgroundColor(color)
            report(next)
        }
    }

    func clear() {
        for model in placedModels {
            model.byARRemoveFromParent()
        }
        for anchor in modelAnchors.values {
            liveView.session.byARRemoveAnchor(anchor)
        }
        placedModels.removeAll()
        pendingModels.removeAll()
        modelAnchors.removeAll()
        modelKinds.removeAll()
        selectedModel = -1
        awaitingPlacement = false
        if previewing {
            layoutPreviewModels()
        }
        report(previewing ? "guidePreviewEmpty" : "guideAim")
    }

    func reset() {
        if previewing {
            showPreview()
        } else {
            startAR()
        }
    }

    func rotateLatest() {
        guard let node = placedModels.last else {
            return
        }
        node.byAREulerAngles(SCNVector3(node.eulerAngles.x, node.eulerAngles.y + Float.pi / 6, node.eulerAngles.z))
        report(state)
    }

    func scaleLatest(_ factor: Float) {
        guard let node = placedModels.last else {
            return
        }
        let value = min(3, max(0.3, node.scale.x * factor))
        node.byARScale(SCNVector3(value, value, value))
        if previewing {
            layoutPreviewModels()
        }
        report(state)
    }

    func refreshState() {
        report(state)
    }

    private func report(_ key: String) {
        state = key
        let latest = placedModels.last
        byARAccessibilityValue("preview:\(previewing);selected:\(selectedModel);last:\(lastModelKind ?? -1);models:\(placedModels.count + pendingModels.count);canPlace:\(canPlace);scale:\(latest?.scale.x ?? 1);rotation:\(latest?.eulerAngles.y ?? 0)")
        onChange?(key, planeNodes.count, placedModels.count + pendingModels.count)
    }

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        DispatchQueue.main.async { [weak self] in
            guard let self, time - self.lastCenterSample >= 0.2 else {
                return
            }
            self.lastCenterSample = time
            self.refreshCenterTarget()
        }
    }

    /// Geometry is in meters. Shapes are assembled locally, without downloaded model assets.
    private func makeModel(_ kind: Int) -> SCNNode {
        let root = SCNNode.jobsMake { _ in }
        if kind == 0 {
            root.byARAddChild(part(SCNBox.make(width: 0.1, height: 0.1, length: 0.1),
                                   position: SCNVector3(0, 0.05, 0),
                                   color: "#FFB547"))
        } else if kind == 1 {
            root.byARAddChild(part(SCNSphere.make(radius: 0.05),
                                   position: SCNVector3(0, 0.05, 0),
                                   color: "#53D8EB"))
        } else {
            root.byARAddChild(part(SCNBox.make(width: 0.075, height: 0.085, length: 0.05),
                                   position: SCNVector3(0, 0.09, 0), color: "#38BFC6"))
                .byARAddChild(part(SCNBox.make(width: 0.09, height: 0.055, length: 0.055),
                                   position: SCNVector3(0, 0.165, 0), color: "#FFBD59"))
            for side: Float in [-1, 1] {
                root.byARAddChild(part(SCNBox.make(width: 0.025, height: 0.06, length: 0.03),
                                       position: SCNVector3(side * 0.056, 0.09, 0), color: "#FFBD59"))
                    .byARAddChild(part(SCNBox.make(width: 0.026, height: 0.05, length: 0.04),
                                       position: SCNVector3(side * 0.023, 0.025, 0), color: "#38BFC6"))
                    .byARAddChild(part(SCNSphere.make(radius: 0.009),
                                       position: SCNVector3(side * 0.022, 0.17, 0.029), color: "#142D3C"))
            }
        }
        return root
    }

    private func part(_ geometry: SCNGeometry,
                      position: SCNVector3,
                      color: String) -> SCNNode {
        return SCNNode.jobsMake { _ in }
            .byARGeometry(geometry.byARColor(UIColor(hex: color)))
            .byARPosition(position)
    }

    func renderer(_ renderer: SCNSceneRenderer,
                  didAdd node: SCNNode,
                  for anchor: ARAnchor) {
        DispatchQueue.main.async { [weak self, weak node] in
            guard let self, let node, !self.previewing, self.visible, self.sessionRunning,
                  self.liveView.session.currentFrame?.anchors.contains(where: { $0.identifier == anchor.identifier }) == true else {
                return
            }
            if let plane = anchor as? ARPlaneAnchor {
                let surface = self.makeSurface(plane)
                self.planeNodes[anchor.identifier] = surface
                node.byARAddChild(surface)
                self.report(self.state)
            } else if let model = self.pendingModels.removeValue(forKey: anchor.identifier) {
                // ARSCNView positions the anchor parent; the model stays in local coordinates.
                node.byARAddChild(model)
                self.placedModels.append(model)
                self.awaitingPlacement = false
                self.report("guidePreviewReady")
            }
        }
    }

    func renderer(_ renderer: SCNSceneRenderer,
                  didUpdate node: SCNNode,
                  for anchor: ARAnchor) {
        guard let plane = anchor as? ARPlaneAnchor else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            guard let self, !self.previewing, self.visible, self.sessionRunning,
                  self.liveView.session.currentFrame?.anchors.contains(where: { $0.identifier == anchor.identifier }) == true,
                  let surface = self.planeNodes[anchor.identifier] else {
                return
            }
            surface.byARGeometry(SCNPlane.make(width: CGFloat(plane.extent.x),
                                                 height: CGFloat(plane.extent.z))
                .byARColor(UIColor(hex: "#1C8E99")?.withAlphaComponent(0.45)))
                .byARPosition(SCNVector3(plane.center.x, 0.001, plane.center.z))
        }
    }

    func renderer(_ renderer: SCNSceneRenderer,
                  didRemove node: SCNNode,
                  for anchor: ARAnchor) {
        DispatchQueue.main.async { [weak self] in
            guard let self else {
                return
            }
            self.planeNodes.removeValue(forKey: anchor.identifier)
            self.pendingModels.removeValue(forKey: anchor.identifier)
            self.modelAnchors.removeValue(forKey: anchor.identifier)
            self.placedModels.removeAll { model in
                if model.parent === node {
                    self.modelKinds.removeValue(forKey: ObjectIdentifier(model))
                    return true
                }
                return false
            }
            self.report(self.state)
        }
    }

    private func makeSurface(_ plane: ARPlaneAnchor) -> SCNNode {
        return SCNNode.jobsMake { _ in }
            .byARGeometry(SCNPlane.make(width: CGFloat(plane.extent.x),
                                         height: CGFloat(plane.extent.z))
                .byARColor(UIColor(hex: "#1C8E99")?.withAlphaComponent(0.45)))
            .byARPosition(SCNVector3(plane.center.x, 0.001, plane.center.z))
            .byAREulerAngles(SCNVector3(-Float.pi / 2, 0, 0))
    }

    func session(_ session: ARSession,
                 cameraDidChangeTrackingState camera: ARCamera) {
        DispatchQueue.main.async { [weak self] in
            guard let self, !self.previewing, self.visible, self.sessionRunning else {
                return
            }
            switch camera.trackingState {
            /// Normal tracking allows placement only on an existing detected plane.
            case .normal:
                self.refreshCenterTarget()
            /// No camera tracking is currently available.
            case .notAvailable:
                self.centerHasSurface = false
                self.report("guideInitializing")
            /// Explain each recoverable tracking condition.
            case .limited(let reason):
                switch reason {
                /// Initialization requires a short scan.
                case .initializing:
                    self.centerHasSurface = false
                    self.report("guideInitializing")
                /// Fast motion makes feature tracking unreliable.
                case .excessiveMotion:
                    self.centerHasSurface = false
                    self.report("guideMotion")
                /// A textured surface provides more visual features.
                case .insufficientFeatures:
                    self.centerHasSurface = false
                    self.report("guideFeatures")
                /// The prior coordinate system is being recovered.
                case .relocalizing:
                    self.centerHasSurface = false
                    self.report("guideInitializing")
                /// Future reasons retain a recovery explanation.
                @unknown default:
                    self.centerHasSurface = false
                    self.report("guideInitializing")
                }
            }
        }
    }

    func sessionWasInterrupted(_ session: ARSession) {
        DispatchQueue.main.async { [weak self] in
            guard let self, !self.previewing else {
                return
            }
            self.sessionRunning = false
            self.centerHasSurface = false
            self.reticle.byHidden(true)
            self.report("guideInterrupted")
        }
    }

    func sessionInterruptionEnded(_ session: ARSession) {
        DispatchQueue.main.async { [weak self] in
            guard let self, self.visible, !self.previewing else {
                return
            }
            self.startAR()
        }
    }

    func session(_ session: ARSession,
                 didFailWithError error: Error) {
        DispatchQueue.main.async { [weak self] in
            guard let self, !self.previewing else {
                return
            }
            self.sessionRunning = false
            self.centerHasSurface = false
            self.reticle.byHidden(true)
            self.report("guideFailed")
        }
    }
}
