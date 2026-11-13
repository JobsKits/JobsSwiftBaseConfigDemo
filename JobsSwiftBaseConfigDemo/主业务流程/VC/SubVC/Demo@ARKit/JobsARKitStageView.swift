//
//  JobsARKitStageView.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

import UIKit
import ARKit
import AVFoundation
import SceneKit

import JobsByUIKit
import JobsSwiftBaseDefines
import SnapKit

/// Camera tracking and offline rendering are separate modes; preview never claims to detect real surfaces.
final class JobsARKitStageView: UIView,
                               ARSCNViewDelegate,
                               ARSessionDelegate {

    var onChange: ((String, Int, Int) -> Void)?
    var selectedModel = 2
    private(set) var previewing = true
    private(set) var wantsAR = false
    private var visible = false
    private var generation = 0
    private var pendingModels: [UUID: SCNNode] = [:]
    private var modelAnchors: [UUID: ARAnchor] = [:]
    private var placedModels: [SCNNode] = []
    private var planeNodes: [UUID: SCNNode] = [:]
    private var state = "previewNotice"

    private lazy var previewView: SCNView = {
        SCNView.jobsMake { _ in }
            .byARScene(SCNScene.jobsMake { _ in })
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        byClipsToBounds().byCornerRadius(18)
        showPreview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setVisible(_ value: Bool) {
        visible = value
        if !value {
            generation += 1
            if !previewing {
                liveView.session.byARPause()
                report("paused")
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
        guard ARWorldTrackingConfiguration.isSupported else {
            wantsAR = false
            report("unsupported")
            return
        }
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
                        self.report("cameraDenied")
                    }
                }
            }
        } else if authorization == .authorized {
            runAR()
        } else {
            report("cameraDenied")
        }
    }

    private func runAR() {
        guard visible else {
            return
        }
        clear()
        planeNodes.removeAll()
        previewing = false
        previewView.byHidden(true)
        liveView.byHidden(false)
        let configuration = ARWorldTrackingConfiguration.jobsMake { _ in }
            .byARPlaneDetection(.horizontal)
        liveView.session.byARRun(configuration)
        report("scanning")
    }

    func showPreview() {
        wantsAR = false
        generation += 1
        if !previewing {
            liveView.session.byARPause()
            liveView.byHidden(true)
        }
        clear()
        planeNodes.removeAll()
        previewing = true
        previewView.byHidden(false)
        let cameraNode = SCNNode.jobsMake { _ in }
            .byARCamera(SCNCamera.jobsMake { _ in }
                .byARClipping(near: 0.01, far: 100))
            .byARPosition(SCNVector3(0, 0.26, 0.55))
            .byAREulerAngles(SCNVector3(-0.38, 0, 0))
        let floor = SCNNode.jobsMake { _ in }
            .byARGeometry(SCNPlane.make(width: 0.8, height: 0.8))
            .byARPosition(SCNVector3(0, -0.001, 0))
            .byAREulerAngles(SCNVector3(-Float.pi / 2, 0, 0))
        floor.geometry?.byARColor(UIColor(hex: "#244959"))
        previewView.byARScene(SCNScene.jobsMake { scene in
            scene.rootNode.byARAddChild(cameraNode).byARAddChild(floor)
        })
            .byARPointOfView(cameraNode)
        addPreviewModel()
        report("previewNotice")
    }

    private func addPreviewModel() {
        guard previewing else {
            return
        }
        let node = makeModel(selectedModel)
            .byARPosition(SCNVector3(Float((placedModels.count + 1) % 3 - 1) * 0.14,
                                     0,
                                     Float(placedModels.count / 3) * -0.14))
        previewView.scene?.rootNode.byARAddChild(node)
        placedModels.append(node)
        report("previewNotice")
    }

    private func placeOnPlane(at point: CGPoint) {
        guard visible, !previewing,
              let tracking = liveView.session.currentFrame?.camera.trackingState,
              case .normal = tracking else {
            report("limited")
            return
        }
        guard let query = liveView.raycastQuery(from: point,
                                               allowing: .existingPlaneGeometry,
                                               alignment: .horizontal),
              let result = liveView.session.raycast(query).first else {
            report("noPlane")
            return
        }
        let anchor = ARAnchor.make(transform: result.worldTransform)
        pendingModels[anchor.identifier] = makeModel(selectedModel)
        modelAnchors[anchor.identifier] = anchor
        liveView.session.byARAddAnchor(anchor)
        report("placed")
    }

    func clear() {
        for model in placedModels {
            model.byARRemoveFromParent()
        }
        if !previewing {
            for anchor in modelAnchors.values {
                liveView.session.byARRemoveAnchor(anchor)
            }
        }
        placedModels.removeAll()
        pendingModels.removeAll()
        modelAnchors.removeAll()
        report(previewing ? "previewNotice" : "empty")
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
            report("empty")
            return
        }
        node.byAREulerAngles(SCNVector3(node.eulerAngles.x,
                                       node.eulerAngles.y + Float.pi / 6,
                                       node.eulerAngles.z))
        report(state)
    }

    func scaleLatest(_ factor: Float) {
        guard let node = placedModels.last else {
            report("empty")
            return
        }
        let value = min(3, max(0.3, node.scale.x * factor))
        node.byARScale(SCNVector3(value, value, value))
        report(state)
    }

    func refreshState() {
        report(state)
    }

    private func report(_ key: String) {
        state = key
        let latest = placedModels.last
        byARAccessibilityValue("preview:\(previewing);scale:\(latest?.scale.x ?? 1);rotation:\(latest?.eulerAngles.y ?? 0)")
        onChange?(key, planeNodes.count, placedModels.count + pendingModels.count)
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
            guard let self, let node, !self.previewing, self.visible,
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
                self.report("placed")
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
            guard let self, !self.previewing, self.visible,
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
                model.parent === node
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
            guard let self, !self.previewing, self.visible else {
                return
            }
            switch camera.trackingState {
            /// Normal tracking allows placement only on an existing detected plane.
            case .normal:
                self.report("trackingNormal")
            /// No camera tracking is currently available.
            case .notAvailable:
                self.report("limited")
            /// Explain each recoverable tracking condition.
            case .limited(let reason):
                switch reason {
                /// Initialization requires a short scan.
                case .initializing:
                    self.report("trackingInitializing")
                /// Fast motion makes feature tracking unreliable.
                case .excessiveMotion:
                    self.report("trackingMotion")
                /// A textured surface provides more visual features.
                case .insufficientFeatures:
                    self.report("trackingFeatures")
                /// The prior coordinate system is being recovered.
                case .relocalizing:
                    self.report("relocalizing")
                /// Future reasons retain a recovery explanation.
                @unknown default:
                    self.report("limited")
                }
            }
        }
    }

    func sessionWasInterrupted(_ session: ARSession) {
        DispatchQueue.main.async { [weak self] in
            guard self?.previewing == false else {
                return
            }
            self?.report("interrupted")
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
            guard self?.previewing == false else {
                return
            }
            self?.report("failed")
        }
    }
}
