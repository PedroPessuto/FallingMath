//
//  OverlayView.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 29/01/24.
//

import Foundation
import SwiftUI

struct OperationsView: View {
    var gameData: GameController
    
    @State var btnPadding: CGFloat = 15
    @State var btnHeight: CGFloat = 51

    
    var azul = Color(red: 81/255, green: 127/255, blue: 221/255)
    var vermelho = Color(red: 1, green: 127/255, blue: 96/255)
    var ciano = Color(red: 79/255, green: 200/255, blue: 187/255)
    var verde = Color(red: 221/255, green: 175/255, blue: 73/255)
    
    @State var textColor: Color = Color(.white)
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("\(gameData.score)")
                        .font(.system(size: 28))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)))
                    Text("SCORE")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)))
                }
                .padding(.leading)
                Spacer()
//                Button(action: {
//                    gameData.isPaused.toggle()
//                    print(gameData.isPaused)
//                }, label: {
//                    Image(systemName: "pause.fill")
//                        .font(.title)
//                        .foregroundStyle(Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)))
//                        .padding(.trailing)
//                })
//                Image(systemName: "pause.fill")
//                    .font(.title)
//                    .foregroundStyle(Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)))
//                    .padding(.trailing)
            }
            
            .padding(.top, 30)
            .ignoresSafeArea()
            Text("0")
                .font(.system(size: 28))
                .fontWeight(.semibold)
                .foregroundStyle(.clear)
                .overlay(
                    Path(roundedRect: CGRect(x: -57, y: 0, width: 135, height: 36), cornerRadii: RectangleCornerRadii(
                        topLeading: 13,
                        bottomLeading: 2,
                        bottomTrailing: 2,
                        topTrailing: 13))
                    .stroke()
                    .stroke(lineWidth: 3)
                    .fill(Color(uiColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)))
                    
                    
                )
                .offset(y: -15)
            Spacer()
        }
         
        
        VStack{
            Spacer()
            HStack(spacing: -10){
                let num1 = String(gameData.number1)
                let num2 = String(gameData.number2)
                ZStack{
                    Text(num1 == "0.0" ? "" : num1)
                        .font(.system(size: 31.8))
                        .foregroundStyle(textColor)
                        .bold()
                        .frame(width: 81, height: 81)
                        .background(num1 == "0.0" ? Color(uiColor: UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 0.3)) :.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.white, lineWidth: 4)
                        )
                        .onTapGesture {
                            if num1 != "0.0"{
                                gameData.returnBlock = Float(num1)!
                                gameData.number1 = 0
                            }
                        }
                }
                .onChange(of: gameData.operation){
                    
                    switch gameData.operation {
                    case "+":
                        textColor = azul
                    case "-":
                        textColor = vermelho
                    case "/":
                        textColor = verde
                    case "x":
                        textColor = ciano
                    default:
                        print("Cor erro")
                    }
                }
                .onAppear(){
                    textColor = azul
                }
                WheelView(gameData: gameData)
                    .offset(x:0, y:40)
                    .zIndex(-1)
                    
                
                Text(num2 == "0.0" ? "" : num2)
                    .font(.system(size: 31.8))
                    .foregroundStyle(textColor)
                    .bold()
                    .frame(width: 81, height: 81)
                    .background(num2 == "0.0" ? Color(uiColor: UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 0.3)) :.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.white, lineWidth: 4)
                    )
                
            }
            HStack{
                Spacer()
            }
            
        }
    }
}

#Preview {
    ZStack{
        Color(.blue)
            .ignoresSafeArea()
        OperationsView(gameData: GameController())
    }
}

