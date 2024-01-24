//
//  ScoreBoardView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 16/01/24.
//

import SwiftUI

struct ScoreBoardView: View {
    var gameData: GameData
    var body: some View {
        VStack {
            HStack {
                Text("\(String(format: "%.0f", gameData.objective))")
            }
            .padding(.top, 60)
            
            Spacer()
        }
    }
}
