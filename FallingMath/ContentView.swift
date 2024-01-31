//
//  ContentView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 16/01/24.
//

import SwiftUI
import SpriteKit
import AVKit
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

struct ContentView: View {
    
    @State var gameController: GameController = GameController()
    
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "MusicaFallingMath", ofType: "mp3")!))
    
    var scene: GameScene {
        let scene = GameScene()
        scene.gameData = gameController
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var body: some View {
        ZStack {
            
            // Background
            BackgroundView(gameData: gameController)
            
            // Tela de pontuação
            ScoreBoardView(gameData: gameController)
           
            // Frame do jogo
            SpriteView(scene: scene, options: [.allowsTransparency], debugOptions: [.showsFPS, .showsNodeCount])
            
            // Fazer operações
            OperationsView(gameData: gameController)
            
            
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            playSound(sound: "MusicaFallingMath", type: "mp3")
            audioPlayer?.numberOfLoops = 100
        })
    }
}

#Preview {
    ContentView()
}
