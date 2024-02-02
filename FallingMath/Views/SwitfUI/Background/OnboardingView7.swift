//
//  Onboarding7.swift
//  FallingMath
//
//  Created by Júlia Luz on 01/02/24.
//



import SwiftUI

struct OnboardingView7: View {
    @State var textColor: Color = Color(.white)
    var gameData: GameController
    var degreess: [Double] = [0, 90, 180, 270]
    @State var index1: Int = 0
    @State var operacoes: [String] = ["+","-","x","/"]
    @State var index: Int = 0
    
    var body: some View {
        ZStack{
            Image("onboarding6")
                .resizable()
            VStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 4)
                        .shadow(color: .white, radius: 30)
                        .frame(width: 346, height: 160)
                    VStack{
                        Text("Don't let the block fill up all the screen and protect our earth!")
                            .foregroundStyle(Color.white)
                            .fontWeight(.semibold)
                            .font(Font.custom("MusticaPro-SemiBold", size: 22))
                            .frame(width: 290, height: 85)
                        
                        HStack{
                            Button(action: {
                                print("Button tapped!")
                            }) {
                                HStack {
                                    Text("PLAY")
                                        .fontWeight(.semibold)
                                        .font(Font.custom("MusticaPro-SemiBold", size: 18))
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 13))
                                        .fontWeight(.semibold)
                                    
                                    
                                }
                            }
                            
                            
                            
                        }
                        .padding(.leading, 250)
                        .foregroundColor(Color(uiColor: UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 0.4)))
                    }
                }
                Spacer()
            }
            .navigationBarBackButtonHidden(true)

            
        }
        .ignoresSafeArea()
        
    }
    
}

#Preview {
    OnboardingView7(gameData: GameController())
}

