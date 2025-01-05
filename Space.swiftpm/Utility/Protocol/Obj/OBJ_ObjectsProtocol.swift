//
//  ObjectsProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import Foundation
import SwiftUICore
import simd

protocol ObjectsProtocol {
    var obj_position: simd_float2 { get set }
    var direction: simd_float2  { get set }
    var mass: Float { get set }
    var isDynamic: Bool { get set }
    var forceApplyedByEnviroment: simd_float2 { get set }
    
    init(radius: Float, position: simd_float2, direction: simd_float2, mass: Float, isDynamic: Bool, forceApplyedByEnviroment: simd_float2)
}
