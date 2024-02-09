//
//  SwiftUIView.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 23/01/24.
//

import SwiftUI

struct WheelView: View {
    
    @Environment(GameController.self) private var gameController
    @State var degreessInfinity: Double = 0
    var degreess: [Double] = [0, 90, 180, 270]
    @State var index: Int = 0
    @State var operacoes: [String] = ["+","-","x","/"]
    @State var textColor: Color = Color(.white)
    
    var body: some View {
        ZStack {
            
            HStack(spacing: 0) {
                ZStack{
                    Image(degreess[index] == 90 ? "onLeft" : "offLeft")
                    if degreess[index] == 90 {
                        Image("minus")
                            .rotationEffect(.degrees(90))
                    }
                   
                }
                
                VStack{}
                    .frame(width: 80,height: 0)
                
                ZStack{
                    Image(degreess[index] == 270 ? "onRight" : "offRight")
                    if degreess[index] == 270 {
                        Image("divide")
                            .rotationEffect(.degrees(90))
                    }
                   
                }
            }
            VStack(spacing: 0){
                ZStack{
                    Image(degreess[index] == 0 ? "onUp" : "offUp")
                    if degreess[index] == 0 {
                        Image("plus")
                    }
                        
                }
                
                ZStack{
                    Image("Center")
                        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                            if !gameController.configIsPaused {
                                if pressing {
                                    if index < operacoes.count - 1{
                                        index += 1
                                        degreessInfinity += 90
                                        gameController.operation = operacoes[index]
                                    }
                                    else {
                                        index = 0
                                        degreessInfinity += 90
                                        gameController.operation = operacoes[index]
                                    }
                                    
                                }
                            }
                            if gameController.configHaptics {
                                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                            }
                        }, perform: {})
                    Text("TAP")
                        .foregroundColor(
                            gameController.operation == "+" ? Color(red: 81/255, green: 127/255, blue: 221/255) : gameController.operation == "-" ? Color(red: 1, green: 127/255, blue: 96/255) : gameController.operation == "x" ? Color(red: 79/255, green: 200/255, blue: 187/255) : Color(red: 221/255, green: 175/255, blue: 73/255)
                        )
                        .font(.custom("MusticaPro-SemiBold", size: 25))
                        .rotationEffect(.degrees(-degreessInfinity))
                        .foregroundStyle(Color("DarkMode"))
                }
                ZStack{
                    Image(degreess[index] == 180 ? "onDown" : "offDown")
                        
                    if degreess[index] == 180 {
                        Image("multiplier")
                            .rotationEffect(.degrees(90))
                    }
                    
                }
            }
        }
        .rotationEffect(.degrees(degreessInfinity))
        .animation(.bouncy(duration: 0.5), value: index)
    }
}
