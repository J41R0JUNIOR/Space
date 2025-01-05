//
//  GetGravityProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 28/11/24.
//

import Foundation
import UIKit
import simd
import SwiftUI

protocol GravityProtocol {
}

extension GravityProtocol {
    
    @MainActor func applyGravity(for object: ObjConformation, deltaTime: TimeInterval) -> (direction: simd_float2, newPosition: simd_float2) {
  
        let deltaTimeGravity = object.mass * Float(deltaTime)
        
        let newDirection = object.direction + object.forceApplyedByEnviroment * Float(deltaTime)
        
        let newPosition = object.obj_position + newDirection * Float(deltaTimeGravity)
        
        return (direction: newDirection, newPosition: newPosition)
    }
    
    @MainActor func applyEnviromentGravity(for objects: inout [ObjConformation], in object:  inout ObjConformation, deltaTime: TimeInterval) {
        let G: Float = 6.674e-11
        
        object.forceApplyedByEnviroment = simd_float2.zero
        
        for otherObject in objects {
            guard otherObject !== object else { continue }
            
            var d: simd_float2 = otherObject.obj_position - object.obj_position
            
            var distance = sqrt(pow(d.x, 2) + pow(d.y, 2))
            
            if distance <= object.radius + object.radius * 0.3 {
                d = object.obj_position - otherObject.obj_position
                
                distance = sqrt(pow(d.x, 2) + pow(d.y, 2))
            }
            
            guard distance > 0 else { continue }
            
            let force = G * (object.mass * otherObject.mass) / (distance * distance)
            
            let direction = d/distance
            
            object.forceApplyedByEnviroment += direction * force
        }
    }
}

#Preview {
    ContentView()
}
