//
//  File.swift
//  Space
//
//  Created by The Godfather Júnior on 05/01/25.
//

import Foundation
import SwiftUI
import simd

import SpriteKit

class CustomCircle: ObjConformation {
    
    required init(radius: Float, position: simd_float2, direction: simd_float2, mass: Float, isDynamic: Bool, forceApplyedByEnviroment: simd_float2) {
        super.init(radius: radius, position: position, direction: direction, mass: mass, isDynamic: isDynamic, forceApplyedByEnviroment: forceApplyedByEnviroment)
        
        // Configuração do círculo
        self.position = obj_position.transformToCGPoint()
     
        
        self.path = CGPath(ellipseIn: CGRect(x: Int(-radius), y: Int(-radius), width: 2 * Int(radius), height: 2 * Int(radius)), transform: nil)
        
        self.fillColor = .blue
        self.strokeColor = .clear
        self.lineWidth = 2
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//class CustomCircleShapeNode: ObjConformation {
//    
//}

//
//
//class CustomCircle: ObjConformation {
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    required init(radius: Float, position: simd_float2, direction: simd_float2, mass: Float, isDynamic: Bool, forceApplyedByEnviroment: simd_float2) {
//        super.init(radius: radius, position: position, direction: direction, mass: mass, isDynamic: isDynamic, forceApplyedByEnviroment: forceApplyedByEnviroment)
//        
//        self.position = position.transformToCGPoint()
//        draw(self.bounds)
//
////        self.backgroundColor = .clear
//    }
//    
//     func draw(_ rect: CGRect) {
////        let userInterfaceStyle = traitCollection.userInterfaceStyle
//
//        guard let context = UIGraphicsGetCurrentContext() else { return }
//        context.addEllipse(in: rect)
////        userInterfaceStyle == .dark ? context.setFillColor(UIColor.white.cgColor) : context.setFillColor(UIColor.black.cgColor)
//         context.setFillColor(UIColor.white.cgColor)
//        context.fillPath()
//    }
//}

#Preview {
    ContentView()
}
