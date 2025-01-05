//
//  File.swift
//  Space
//
//  Created by The Godfather Júnior on 05/01/25.
//

import simd
import Foundation


extension simd_float2 {
    func transformToCGPoint() -> CGPoint {
        return CGPoint(x: Double(self.x), y: Double(self.y))
    }
}
