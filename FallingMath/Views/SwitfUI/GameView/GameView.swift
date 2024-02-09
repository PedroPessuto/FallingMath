//
//  GameView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 01/02/24.
//

import SwiftUI
import SpriteKit
import SwiftData

struct GameView: View {
    
    @Environment(GameController.self) private var gameController
    @Environment(\.modelContext) var context
    
    @Query private var items: [SavedData]
    
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
            
            if !gameController.hasLose {
                VStack (spacing: 0)  {
                    
                    // Tela de pontuação
                    ScoreBoardView()
                    
                    ZStack {
                        
                        // Background Gradiente Na Área do Jogo
                        RoundedRectangle(cornerRadius: 13)
                            .foregroundStyle(Gradient(colors: [Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)), .clear]))
                        
                        // Frame do jogo
                        // SpriteView(scene: scene, options: [.allowsTransparency], debugOptions: [.showsFPS, .showsNodeCount])
                        SpriteView(scene: scene, options: [.allowsTransparency])
                        
                        
                    }
                    .frame(width: .infinity)
                    .frame(height: 490)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 4)
                    )
                    
                    // Fazer operações
                    OperationsView()
                    
                    
                }
                
                .padding(22)
            }
            
            if(gameController.configIsPaused) {
                PauseMenu()
            }
            
            if gameController.hasLose {
                LoseView()
            }
        }
        
    }
    
    func startGame() {
        if(items.isEmpty) {
            let item = SavedData(score: 0, sound: true, music: true, haptics: true, onBoarding: true)
            context.insert(item)
        }
    }
    
}
