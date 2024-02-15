//
// LoseView.swift
// FallingMath
//
// Created by Júlia Luz on 08/02/24.
//

import SwiftUI

struct LoseView: View {
    @Environment(GameController.self) private var gameController
    var characters: [String] = ["loseWalter", "loseCelsius", "loseFlora", "loseWindy"]
    var texts: [String] = ["Ah não! Os blocos \nforam por água baixo... ", "Ah não! Os blocos \nviraram cinzas...", "Ah não! Os blocos \nforam levados...", "Ah não! Os blocos \nforam soterrados..."]
    @State var index: Int = 0
    var red: Color = Color(red: 255/255, green: 131/255, blue: 114/255)
    var green: Color = Color(red: 217/255, green: 189/255, blue: 102/255)
    var blue: Color = Color(red: 117/255, green: 201/255, blue: 255/255)
    var cyan: Color = Color(red: 62/255, green: 172/255, blue: 159/255)
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 334, height: 523)
                .foregroundStyle(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.13)))
                .shadow(radius: 10)
                .overlay{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 4)
                        .foregroundStyle(.clear)
                }
                .offset(y: 50)
            VStack(spacing: 0){
                Image( gameController.operation == "+" ? "loseWalter" :
                        gameController.operation == "-" ? "loseCelsius" : gameController.operation == "x" ? "loseWindy" : "loseFlora")
                .frame(width:236, height: 234)
                .zIndex(1)
                VStack{
                    Text(gameController.operation == "+" ? "Ah não! Os blocos \nforam por água baixo... " :
                            gameController.operation == "-" ? "Ah não! Os blocos \nviraram cinzas..." : gameController.operation == "x" ? "Ah não! Os blocos \nforam levados..." : "Ah não! Os blocos \nforam soterrados...")
                        .font(.custom("MusticaPro-SemiBold", size: 24))
                        .padding(.bottom, 40)
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    Text("PONTUAÇÃO")
                        .font(.custom("MusticaPro-SemiBold", size: 18))
                        .foregroundStyle(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.73)))
                    Text("\(gameController.score)")
                        .font(.custom("MusticaPro-SemiBold", size: 64))
                        .foregroundStyle(.white)
                    
//                    Button(action: {
//                        gameController.startGame()
//                    }, label: {
//                        RoundedRectangle(cornerRadius: 34)
//                            .frame(width: 236, height: 68)
//                            .foregroundStyle(Color(.white))
//                            .shadow(radius:3)
//                            .overlay{
//                                HStack{
//                                    Image(systemName:"arrow.clockwise")
//                                        .font(.system(size: 24))
//                                        .bold()
//                                    Text("JOGUE NOVAMENTE")
//                                        .font(.system(size: 18))
//                                        .fontWeight(.heavy)
//                                }
//                                .foregroundStyle(
//                                    gameController.operation == "+" ? blue :
//                                        gameController.operation == "-" ? red : gameController.operation == "x" ? cyan : gameController.operation == "/" ? green : .white)
//                            }
//                    }
//                    )
                    Button(action: {
//                        gameController.startGame()
                        gameController.configScreenName = "home"
                    },
                           label: {
                        RoundedRectangle(cornerRadius: 34)
                            .frame(width: 236, height: 68)
                            .foregroundStyle(Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0.13)))
                            .shadow(radius:3)
                            .overlay{
                                RoundedRectangle(cornerRadius: 34)
                                    .stroke(.white, lineWidth: 4)
                                    .foregroundStyle(.clear)
                                HStack{
                                    Image(systemName: "house")
                                        .font(.system(size: 24))
                                        .bold()
                                    Text("MENU")
                                        .font(.system (size: 18))
                                        .fontWeight(.heavy)
                                }
                                .foregroundStyle(Color(.white))
                            }
                    })
                }
                Spacer()
            }
        }
    }
}

