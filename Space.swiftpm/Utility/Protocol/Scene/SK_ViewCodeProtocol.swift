//
//  File.swift
//  Space
//
//  Created by The Godfather Júnior on 05/01/25.
//

import SpriteKit

protocol ViewCode {
    // Adds views as subviews and defines the hierarchy between them
    func addViews()
    
    // Defines the constraints to be used for positioning the elements in the view
    func addConstraints()
    
    // Defines the styles for the view, such as color, borders, etc.
    func setupStyle()
}


// Chama todos os métodos do protocolo
extension ViewCode {
    func setupViewCode() {
        addViews()
        addConstraints()
        setupStyle()
    }
}
