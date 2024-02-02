//
//  ScoreBoardView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 16/01/24.
//

import SwiftUI

struct ScoreBoardView: View {
    
    @Environment(GameController.self) private var gameController
    var body: some View {
        VStack (spacing: 0) {
            HStack {
                
                VStack {
                    Text("\(gameController.score)")
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)))
                    
                    Text("SCORE")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)))
                }
                
                Spacer()
                
                Button (action: {
                    gameController.configIsPaused.toggle()
                }) {
                    Image(systemName: "pause.fill")
                        .font(.title)
                        .foregroundStyle(Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)))
                }
                
            }
            
            HStack {
                
                Text(gameController.formatNumber(gameController.objective))
                    .frame(width: 135)
                    .overlay(
                        Path(roundedRect: CGRect(x: 0, y: -3, width: 135, height: 36), cornerRadii: RectangleCornerRadii(
                            topLeading: 13,
                            bottomLeading: 2,
                            bottomTrailing: 2,
                            topTrailing: 13))
                        .stroke()
                        .stroke(lineWidth: 3)
                        .fill(Color(uiColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)))
                        

                    )
                    .foregroundStyle(Color(uiColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)))
                    .font(.system(size: 28))
                    .fontWeight(.semibold)
                    .animation(.easeInOut(duration: 1))
                    .modifier(Glow(text: gameController.formatNumber(gameController.objective)))
            }
            .frame(maxWidth: .infinity)
            
            
        }
    }
}

struct Glow: ViewModifier{
    @State var text: String
    func body(content: Content) -> some View {
        var timer: CGFloat = 5
        ZStack{
            content.blur(radius: timer)
            content
        }
        .onChange(of: text){
            timer = 0
        }
    }
}
