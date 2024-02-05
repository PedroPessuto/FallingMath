//
//  SwiftUIView.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 23/01/24.
//

import SwiftUI

struct WheelView: View {
    var gameData: GameController
    var degreess: [Double] = [0, 90, 180, 270]
    @State var angles: Double = 0
    @State var index1: Int = 0
    @State var operacoes: [String] = ["+","-","x","/"]
    @State var index: Int = 0
    var body: some View {
        
        ZStack{
            HStack(spacing: 0){
                ZStack{
                    Image(degreess[index] == 90 ? "onLeft" : "offLeft")
                        .resizable()
                        .frame(width: 61, height: 118)
                    Image(degreess[index] == 90 ? "minus" : "")
                        .rotationEffect(.degrees(90))
                }
                Image("")
                    .frame(width: 60,height: 60)
                
                ZStack{
                    Image(degreess[index] == 270 ? "onRight" : "offRight")
                        .resizable()
                        .frame(width: 61, height: 118)
                    Image(degreess[index] == 270 ? "divide" : "")
                        .rotationEffect(.degrees(90))
                }
            }
            VStack(spacing: 0){
                ZStack{
                    Image(degreess[index] == 0 ? "onUp" : "offUp")
                        .resizable()
                        .frame(width: 118, height: 61)
                    Image(degreess[index] == 0 ? "plus" : "")
                        
                }
                Image("Center")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .onTapGesture {
                        if Int(index) == degreess.count - 1{
                            index = 0
                            angles += 90
                        }else{
                            index += 1
                            angles += 90
                        }
                        
                        if index1 < operacoes.count - 1{
                            index1 += 1
                            gameData.operation = operacoes[index1]
                            
                        }else{
                            index1 = 0
                            gameData.operation = operacoes[index1]
                            
                        }
                        
                    }
                   
                ZStack{
                    Image(degreess[index] == 180 ? "onDown" : "offDown")
                        .resizable()
                        .frame(width: 118, height: 61)
                    Image(degreess[index] == 180 ? "multiplier" : "")
                        .rotationEffect(.degrees(90))
                }
            }
            
        }
        .rotationEffect(.degrees(angles))
        .animation(.bouncy(duration: 0.5), value: angles)
        
    }
    
}

#Preview {
    ZStack{
        Color(.blue)
        WheelView(gameData: GameController())
    }
}
