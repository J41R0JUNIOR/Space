//
//  File.swift
//  Space
//
//  Created by The Godfather Júnior on 05/01/25.
//

import SpriteKit

// Extension that allows adding multiple views to the hierarchy in a single call. Example: addViews(label1, label2, button1, button2)
extension SKScene {
    func addListSubviews(_ views: SKScene...) {
        for view in views {
            addChild(view)
        }
    }
}
