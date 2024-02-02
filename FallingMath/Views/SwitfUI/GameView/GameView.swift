//
//  GameView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 01/02/24.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    @Environment(GameController.self) private var gameController
//    @State var isPaused: Bool = false
    
    var scene: GameScene {
        let scene = GameScene()
        scene.gameData = gameController
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var body: some View {
        ZStack {
            
            // Background
            BackgroundView()
            
            VStack (spacing: 0)  {
                
                // Tela de pontuação
                ScoreBoardView()
                
                ZStack {
                    
                    // Background Gradiente Na Área do Jogo
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundStyle(Gradient(colors: [Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)), .clear]))
                    
                    // Frame do jogo
                    // SpriteView(scene: scene, isPaused: isPaused,options: [.allowsTransparency], debugOptions: [.showsFPS, .showsNodeCount])
                    SpriteView(scene: scene, isPaused: gameController.configIsPaused, options: [.allowsTransparency])
                        
   
                }
                .frame(width: .infinity)
                .frame(height: 490)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                
                // Fazer operações
                OperationsView()
                
                Spacer()
            }
            
            .padding(22)
        }
        .onChange(of: gameController.configIsPaused) { _, _ in
//            print(scene.isPaused)
            scene.teste()
//            print(scene.isPaused)
        }
//        .onChange(of: gameController.configIsPaused) { oldValue, newValue in
//            scene.teste()
//        }
        
    }
}
