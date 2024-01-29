//
//  ContentView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 16/01/24.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var gameController: GameController = GameController()
    
    var scene: GameScene {
        let scene = GameScene()
        scene.gameData = gameController
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var body: some View {
        ZStack {
            // Background
            BackgroundView(operation: gameController.operation)
            
            // Tela de pontuação
            ScoreBoardView(gameData: gameController)
            
            // Frame do jogo
            SpriteView(scene: scene, options: [.allowsTransparency], debugOptions: [.showsFPS, .showsNodeCount])
                
            // Fazer operações
            OperationsView(gameData: gameController)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
