//
//  ObjectClassToConformToProtocols.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 30/11/24.
//

import Foundation
import simd
import SpriteKit
import SwiftUI

class ObjConformation: SKShapeNode, @preconcurrency ObjectsProtocol, GravityProtocol, PathProtocol {
    let id: UUID = .init()
    var obj_position: simd_float2
    var direction: simd_float2
    var forceApplyedByEnviroment: simd_float2
    var mass: Float
    var radius: Float
    var isDynamic: Bool
    var obj_path: UIBezierPath = .init()
    
    required init(radius: Float, position: simd_float2, direction: simd_float2 = .init(), mass: Float, isDynamic: Bool, forceApplyedByEnviroment: simd_float2 = .init()) {
        self.forceApplyedByEnviroment = forceApplyedByEnviroment
        self.direction = direction
        self.isDynamic = isDynamic
        self.mass = mass
        self.obj_position = position
        self.radius = radius
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(deltatime: TimeInterval){
        let result = applyGravity(for: self, deltaTime: deltatime)
        self.obj_position = result.newPosition
        self.direction = result.direction

    }
}

#Preview {
    ContentView()
}
