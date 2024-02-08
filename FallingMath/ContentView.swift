//
//  ContentView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 16/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var gameController: GameController = GameController()
    @State var audioController: AudioController = AudioController()
    
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
        
    }
}

#Preview {
    ContentView()
}



