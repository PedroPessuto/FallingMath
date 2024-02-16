//
//  ContentView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 16/01/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var gameController: GameController = GameController()
    @State var audioController: AudioController = AudioController()
    @State var dataController: DataController = DataController()
    @Environment(\.modelContext) private var context
    @Query private var items: [SavedData]
   
    
    var body: some View {
        VStack {
            if gameController.configScreenName == "home" {
                HomeView()
            }
            else if gameController.configScreenName == "tutorial"{
                OnboardingView()
            }
            else {
                GameView()
            }
        }
        .environment(gameController)
        .environment(audioController)
        .environment(dataController)
        .statusBar(hidden: true)
        .persistentSystemOverlays(.hidden)
        .onAppear {
            dataController = DataController(context: context, items: items)
            
            if let items = dataController.items {
               
                if !items.isEmpty {
                    gameController.score = items[0].score
                    gameController.configHaptics = items[0].haptics
                    gameController.configScreenName = items[0].onBoarding ? "tutorial" : "home"
                    gameController.configOnBoarding = items[0].onBoarding
                    
                    audioController.musicEnabled = items[0].music
                    audioController.check()
                }
                

            }
            
        }
    }
   
}

#Preview {
    ContentView()
        
}
