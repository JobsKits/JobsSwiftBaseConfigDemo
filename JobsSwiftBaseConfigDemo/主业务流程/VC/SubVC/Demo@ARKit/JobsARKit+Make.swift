//
//  JobsARKit+Make.swift
//  JobsSwiftBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

import UIKit
import ARKit
import SceneKit

import JobsSwiftDSL
import JobsSwiftBaseDefines

/// Demo-scoped adapters keep native AR/SceneKit creation and mutation on their owning types.
extension SCNView {

    @discardableResult
    func byARScene(_ value: SCNScene) -> Self {
        scene = value
        return self
    }

    @discardableResult
    func byARPointOfView(_ value: SCNNode) -> Self {
        pointOfView = value
        return self
    }

    @discardableResult
    func byARCameraControl(_ value: Bool) -> Self {
        allowsCameraControl = value
        return self
    }

    @discardableResult
    func byARLighting(_ value: Bool) -> Self {
        autoenablesDefaultLighting = value
        return self
    }
}

extension ARSCNView {

    @discardableResult
    func byARDelegate(_ value: ARSCNViewDelegate) -> Self {
        delegate = value
        return self
    }

    @discardableResult
    func byARSessionDelegate(_ value: ARSessionDelegate) -> Self {
        session.delegate = value
        return self
    }
}

extension ARSession {

    @discardableResult
    func byARRun(_ value: ARWorldTrackingConfiguration) -> Self {
        run(value, options: [.resetTracking, .removeExistingAnchors])
        return self
    }

    @discardableResult
    func byARPause() -> Self {
        pause()
        return self
    }

    @discardableResult
    func byARAddAnchor(_ value: ARAnchor) -> Self {
        add(anchor: value)
        return self
    }

    @discardableResult
    func byARRemoveAnchor(_ value: ARAnchor) -> Self {
        remove(anchor: value)
        return self
    }
}

extension ARWorldTrackingConfiguration {

    @discardableResult
    func byARPlaneDetection(_ value: ARWorldTrackingConfiguration.PlaneDetection) -> Self {
        planeDetection = value
        return self
    }
}

extension ARAnchor {

    static func make(transform: simd_float4x4) -> ARAnchor {
        return ARAnchor(transform: transform)
    }
}

extension SCNNode {

    @discardableResult
    func byARAddChild(_ value: SCNNode) -> Self {
        addChildNode(value)
        return self
    }

    @discardableResult
    func byARRemoveFromParent() -> Self {
        removeFromParentNode()
        return self
    }

    @discardableResult
    func byARPosition(_ value: SCNVector3) -> Self {
        position = value
        return self
    }

    @discardableResult
    func byAREulerAngles(_ value: SCNVector3) -> Self {
        eulerAngles = value
        return self
    }

    @discardableResult
    func byARScale(_ value: SCNVector3) -> Self {
        scale = value
        return self
    }

    @discardableResult
    func byARCamera(_ value: SCNCamera) -> Self {
        camera = value
        return self
    }

    @discardableResult
    func byARGeometry(_ value: SCNGeometry) -> Self {
        geometry = value
        return self
    }
}

extension SCNBox {

    static func make(width: CGFloat,
                       height: CGFloat,
                       length: CGFloat) -> SCNBox {
        return SCNBox(width: width, height: height, length: length, chamferRadius: 0.005)
    }
}

extension SCNSphere {

    static func make(radius: CGFloat) -> SCNSphere {
        return SCNSphere(radius: radius)
    }
}

extension SCNPlane {

    static func make(width: CGFloat,
                       height: CGFloat) -> SCNPlane {
        return SCNPlane(width: max(width, 0.001), height: max(height, 0.001))
    }
}

extension SCNGeometry {

    @discardableResult
    func byARColor(_ value: UIColor?) -> Self {
        materials = [SCNMaterial.jobsMake { material in
            material.diffuse.contents = value ?? JobsCor.systemTeal
            material.lightingModel = .physicallyBased
            material.roughness.contents = 0.65
            material.isDoubleSided = true
        }]
        return self
    }
}


extension UIView {

    @discardableResult
    func byARAccessibilityValue(_ value: String) -> Self {
        accessibilityValue = value
        return self
    }
}


extension SCNCamera {

    @discardableResult
    func byARClipping(near: Double,
                      far: Double) -> Self {
        zNear = near
        zFar = far
        return self
    }
}
