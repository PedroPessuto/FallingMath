//
//  ScoreBoardView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 16/01/24.
//

import SwiftUI

struct ScoreBoardView: View {
    var gameData: GameController
    
    var body: some View {
        VStack {
            HStack {
                Text("\(String(format: "%.1f", gameData.objective))")
                    .foregroundStyle(Color(uiColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)))
                    .font(.system(size: 28))
                    .fontWeight(.semibold)
            }
            .padding(.top, 75)
            
            Spacer()
        }
    }
}
