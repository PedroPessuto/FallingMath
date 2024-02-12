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
    @Environment(\.modelContext) private var context
    
    @Query private var items: [SavedData]
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var count: Int = 0
    
    
    
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
            
            ZStack{
                RoundedRectangle(cornerRadius: 13)
                    .foregroundStyle(Gradient(colors: [Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)), .clear]))
                    .frame(width: 390 - 56, height: 491)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 4)
                            .frame(width: 334, height: 491)
                    )
                    .padding(.bottom, 142)
                
                SpriteView(scene: scene, options:[.allowsTransparency])
                    .ignoresSafeArea()
            }
            
            if(gameController.configIsPaused) {
                PauseMenu()
            }
            
            VStack {
                ScoreBoardView()
                    .padding(.bottom, 25)
                
                OperationsView()
                    .frame(height: 400)
                    .padding(.bottom, 260)
            }.frame(width: 334)
                .padding(.bottom, 20)
            
            VStack{
                if gameController.feedback == true {
                    
                    Text("Acertou!")
                        .onAppear{
                            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        }
                   
                    
                } else if gameController.feedback == false{
                    
                    Text("Errou!")
                        .onAppear{
                            timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        }
                    
                }
            }
            
            if gameController.hasLose {
                LoseView()
            }
            
        }
        .onAppear {
//            timer.upstream.connect().cancel()
            startGame()
        }
        .onReceive(timer){ i in
            count += 1
            if count == 2{
                count = 0
                gameController.feedback = nil
                timer.upstream.connect().cancel()
            }
            print(count)
            
        }
        
        
    }
    
    func startGame() {
        if(items.isEmpty) {
            let item = SavedData(score: 0, sound: true, music: true, haptics: true, onBoarding: true)
            context.insert(item)
        }
        
        
    }
    
    // Vai no botão de play
    func firstPlay() {
        if items.isEmpty {
            addItem(score: 0, sound: true, music: true, haptics: true, onBoarding: true)
        }
    }
    
    func addItem(score: Int, sound: Bool, music: Bool, haptics: Bool, onBoarding: Bool) {
        
        let item = SavedData(score: score, sound: sound, music: music, haptics: haptics, onBoarding: onBoarding)
        
        context.insert(item)
    }
    
    // Rodado toda vez que terminar o jogo
    func updateItem(_ item: SavedData) {
        item.onBoarding = false
        try? context.save()
    }
    
}

#Preview{
    GameView()
        .environment(GameController())
}
