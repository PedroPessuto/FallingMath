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
        NavigationStack{
            
            ZStack{
                Image("onboarding6")
                    .resizable()
                VStack{
                    VStack{
                        Image("celsius3")
                            .padding(.leading, 150)
                        VStack{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 4)
                                .shadow(color: .white, radius: 30)
                                .frame(width: 346, height: 160)
                                .overlay{
                                    VStack{
                                        Text("Don't let the block fill up all the screen and protect our earth!")
                                            .foregroundStyle(Color.white)
                                            .fontWeight(.semibold)
                                            .font(Font.custom("MusticaPro-SemiBold", size: 22))
                                            .frame(width: 290, height: 85)
                                        
                                        HStack{
                                            
                                            NavigationLink(destination: ContentView(), label: {
                                                HStack {
                                                    Text("PLAY")
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
                        Spacer()
                    }
                    .padding(.top, 200)
                    
                    
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)

    }
    
}

#Preview {
    OnboardingView7(gameData: GameController())
}

