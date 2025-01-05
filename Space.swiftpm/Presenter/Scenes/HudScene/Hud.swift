//
//  SwiftUIView.swift
//  Space
//
//  Created by The Godfather Júnior on 05/01/25.
//

import SwiftUI

struct Hud: View {
    @Binding var game: SpaceScene
    
    var body: some View {
        VStack{
            HStack{
                Spacer()

                Button{
                    game.removeAllObjects()
//                    game.removeAllObjects()
//                    for n in game.objects {
//                        
//                        n.removeFromParent()
//                        game.objects.removeAll(where: { $0 === n })
//                        game.view?.layer.sublayers?.removeAll(where: { $0 is CAShapeLayer })
//                        
//                        print("removing")
//                        print(game.objects.count)
//                    }
                } label: {
                    Text("Reset")
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    Hud(game: .constant(.init()))
}
