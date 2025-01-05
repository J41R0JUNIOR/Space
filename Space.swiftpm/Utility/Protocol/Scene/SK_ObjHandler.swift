//
//  File.swift
//  Space
//
//  Created by The Godfather Júnior on 05/01/25.
//

import SpriteKit
import simd
import SwiftUI

protocol ViewProtocol: SKScene {
    var objects: [ObjConformation] { get set }
}

extension ViewProtocol {
    func addObject<T: ObjConformation>(type: T.Type ,position: simd_float2, radius: Float, mass: Float, isDynamic: Bool = true, in view: SKScene & ViewProtocol) {

        let randomDirectionforce: simd_float2 = .init(Float.random(in: -0.01...0.01), Float.random(in: -0.01...0.01))
        
        let obj = T(radius: radius, position: position, mass: mass, isDynamic: isDynamic, forceApplyedByEnviroment: randomDirectionforce)
        obj.zPosition = -1
        view.addChild(obj)
        view.objects.append(obj)
        
        print(view.objects.count)
    }
    
    func updateObjects(_ deltaTime: TimeInterval, isCreatingPaht: Bool){
        for var n: ObjConformation in objects {
            
            if  !isObjectInView(n){
                n.removeFromParent()
            }

            n.update(deltatime: deltaTime)
            n.applyEnviromentGravity(for: &objects, in: &n, deltaTime: deltaTime)
            
            if isCreatingPaht {
                n.createPath(for: n)
            }
        }
    }
    
    func isObjectInView(_ object: ObjConformation) -> Bool {
        guard let scene = object.scene else { return false }
        
        let objectPositionInScene = scene.convert(object.position, from: object.parent!)
        
        return scene.frame.contains(CGPoint(x: CGFloat(objectPositionInScene.x), y: CGFloat(objectPositionInScene.y)))
    }
    
    func removeAllObjects(){
        for n in objects {
            
            n.removeFromParent()
            objects.removeAll(where: { $0 === n })
            view?.layer.sublayers?.removeAll(where: { $0 is CAShapeLayer })
            
            print("removing")
            print(objects.count)
        }
    }
}

#Preview {
    ContentView()
}
