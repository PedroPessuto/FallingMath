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
    
    @Query private var items: [SavedData]
    
    var body: some View {
        VStack {
            if gameController.configScreenName == "home" {
                HomeView()
            }
            else {
                GameView()
            }
        }
        .environment(gameController)
        .environment(audioController)
        .statusBar(hidden: true)
        .persistentSystemOverlays(.hidden)
        .onAppear {
            gameController.configHaptics = items[0].haptics
        }
    }
}

#Preview {
    ContentView()
}
