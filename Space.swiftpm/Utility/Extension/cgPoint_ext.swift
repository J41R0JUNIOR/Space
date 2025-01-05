//
//  File.swift
//  Space
//
//  Created by The Godfather Júnior on 05/01/25.
//

import simd
import CoreFoundation

extension CGPoint {
    func transformToSimd_Float2() -> simd_float2 {
        return simd_float2(x: Float(self.x), y: Float(self.y))
    }
}
