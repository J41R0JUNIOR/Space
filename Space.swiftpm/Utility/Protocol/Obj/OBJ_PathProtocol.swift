//
//  PathProtocol.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 02/12/24.
//

import Foundation
import QuartzCore
import SpriteKit
import SwiftUI


protocol PathProtocol: SKNode {
}

extension PathProtocol {
    func createPath(for object: ObjConformation) {
        object.obj_path.removeAllPoints()
        
        let steps = 10
        let timeStep: TimeInterval = 0.1
        var simulatedPosition = object.obj_position
        var simulatedDirection = object.direction
        
        object.obj_path.move(to: CGPoint(x: CGFloat(simulatedPosition.x), y: CGFloat(simulatedPosition.y)))
        
        for _ in 1...steps {
            let deltaTimeGravity = object.mass * Float(timeStep)
            simulatedDirection += object.forceApplyedByEnviroment * Float(timeStep)
            simulatedPosition += simulatedDirection * Float(deltaTimeGravity)
            
            object.obj_path.addLine(to: simulatedPosition.transformToCGPoint())
        }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = object.obj_path.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.fillColor = nil
        shapeLayer.name = "\(object.id)"
        
//        if let node = self.superview?.layer.sublayers?.first(where: { $0.name == "\(object.id)" }){
//            node.removeFromSuperlayer()
//        }
//        
//        self.superview?.layer.addSublayer(shapeLayer)
        
        if let node = self.inputView?.superview?.layer.sublayers?.first(where: { $0.name == "\(object.id)" }){
            node.removeFromSuperlayer()
        }
        
        self.inputView?.layer.addSublayer(shapeLayer)
    }
}


#Preview {
    ContentView()
}

