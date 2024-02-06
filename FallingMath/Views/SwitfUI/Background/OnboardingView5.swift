//
//  OnboardingView5.swift
//  FallingMath
//
//  Created by Júlia Luz on 01/02/24.
//

import SwiftUI

struct OnboardingView5: View {
    @State var textColor: Color = Color(.white)
    var gameData: GameController
    var degreess: [Double] = [90]
    @State var index1: Int = 0
    @State var operacoes: [String] = ["-"]
    @State var index: Int = 0
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("onboarding5")
                    .resizable()
                VStack{
                    Spacer()
                    VStack{
                        Image("celsius1")
                            .padding(.leading, 150)
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 4)
                                .shadow(color: .white, radius: 30)
                                .frame(width: 346, height: 120)
                            VStack{
                                Text("Perfect")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.semibold)
                                    .font(Font.custom("MusticaPro-SemiBold", size: 22))
                                    .frame(width: 290, height: 71,alignment: .leading)
                                HStack{
                                    
                                    NavigationLink(destination: OnboardingView2(), label: {
                                        HStack {
                                            Text("SKIP")
                                                .font(Font.custom("MusticaPro-SemiBold", size: 18))
                                                .fontWeight(.semibold)
                                            Image(systemName: "chevron.right")
                                                .font(.system(size: 13))
                                                .fontWeight(.semibold)
                                            
                                            
                                        }
                                    })
                                    
                                    
                                }
                                .padding(.leading, 250)
                                
                                .foregroundColor(Color(uiColor: UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 0.4)))
                            }
                        }
                    }
                    .padding(.top, 150)
                    Spacer()
                    ZStack{
                        HStack(spacing: 0){
                            ZStack{
                                Image(degreess[index] == 90 ? "onLeft" : "offLeft")
                                    .resizable()
                                    .frame(width: 71, height: 138)
                                Image(degreess[index] == 90 ? "minus" : "")
                                    .rotationEffect(.degrees(90))
                            }
                            Image("")
                                .frame(width: 70,height: 70)
                            
                            ZStack{
                                Image(degreess[index] == 270 ? "onRight" : "offRight")
                                    .resizable()
                                    .frame(width: 71, height: 138)
                                Image(degreess[index] == 270 ? "divide" : "")
                                    .rotationEffect(.degrees(90))
                            }
                        }
                        VStack(spacing: 0){
                            ZStack{
                                Image(degreess[index] == 0 ? "onUp" : "offUp")
                                    .resizable()
                                    .frame(width: 138, height: 71)
                                Image(degreess[index] == 0 ? "plus" : "")
                                
                            }
                            ZStack{
                                Image("Center")
                                    .resizable()
                                    .shadow(color: .white, radius: 8)
                                    .frame(width: 70, height: 70)
                                    .onTapGesture {
                                        if Int(index) == degreess.count - 1{
                                            index = 0
                                        }else{
                                            index += 1
                                        }
                                        
                                        if index1 < operacoes.count - 1{
                                            index1 += 1
                                            gameData.operation = operacoes[index1]
                                            
                                        }else{
                                            index1 = 0
                                            gameData.operation = operacoes[index1]
                                            
                                        }
                                        
                                    }
                                Text("TAP")
                                    .font(.custom("MusticaPro-SemiBold", size: 24))
                                    .foregroundColor(Color(red: 255/255, green: 102/255, blue: 102/255))
                                    .rotationEffect(.degrees(index == 90 ? 90 : -90))

                                
                            }
                            
                            ZStack{
                                Image(degreess[index] == 180 ? "onDown" : "offDown")
                                    .resizable()
                                    .frame(width: 138, height: 71)
                                Image(degreess[index] == 180 ? "multiplier" : "")
                                    .rotationEffect(.degrees(90))
                            }
                        }
                        
                    }
                    
                    .rotationEffect(.degrees(degreess[index]))
                    .animation(.bouncy(duration: 0.5), value: index)
                    
                }
                
                
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    OnboardingView5(gameData: GameController())
}

