//
//  File.swift
//  Space
//
//  Created by The Godfather Júnior on 05/01/25.
//

import SpriteKit

class SpaceScene: SKScene, ViewProtocol {
    var objects: [ObjConformation] = []
   
    
    override func sceneDidLoad() {
        setupViewCode()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            let mass = Float.random(in: 50_000...100_000)
            let radius = mass / 10000
           
            self.addObject(type: CustomCircle.self, position: position.transformToSimd_Float2(), radius: radius, mass: mass, in: self)
            
            self.addObject(type: CustomCircle.self, position: .zero, radius: 1, mass: 1, in: self)
        }
    }
}
