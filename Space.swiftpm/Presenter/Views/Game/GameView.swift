//
//  SwiftUIView.swift
//  Space
//
//  Created by The Godfather Júnior on 05/01/25.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct GameView: View {
    @State var game = SpaceScene()
    var body: some View {
        
        ZStack{
            SpriteView(scene: game)
                .ignoresSafeArea()
               
            Hud(game: $game)
            
        }
    }
}

#Preview {
    GameView()
}
