//
//  ContentView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 16/01/24.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var scene: SKScene {
        let scene = GameScene()
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var phaseController: PhaseController {
        let phaseConstroller = PhaseController()
        phaseConstroller.targetNumber = 2
        return phaseConstroller
    }
    
    
    var body: some View {
        ZStack {
            
            SpriteView(scene: scene)
            
            
            ScoreBoardView()
                .onAppear {
                    phaseController.ganerateNewLevel()
                }
            
            
            if let targetNumber = phaseController.targetNumber {
                Text("\(targetNumber)")
                    .font(.system(size: 100))
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            
            
            
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
