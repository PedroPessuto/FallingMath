//
// ProgressBarView.swift
// FallingMath
//
// Created by Rafael Carreira on 01/02/24.
//

import SwiftUI

struct ProgressBarView: View {

    @Environment(GameController.self) private var gameController
    @State var animatedValue: CGFloat = 0
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(uiColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)))
            
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: max(0, min(animatedValue * geometry.size.width, geometry.size.width)))
                    .onChange(of: gameController.valueTimer) { _, newValue in
                        withAnimation(.easeInOut(duration: 0.1)) {
                            animatedValue = newValue
                            if gameController.configHaptics {
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            }
                        }
                    }
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(height: 7)
        }
       
    }
}
