//
//  OnboardingView3.swift
//  FallingMath
//
//  Created by Júlia Luz on 01/02/24.
//



import SwiftUI

struct OnboardingView3: View {
    @State var textColor: Color = Color(.white)
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("onboarding3")
                    .resizable()
                VStack{
                    Spacer()
                    
                    
                    Text("15")
                    
                        .font(.system(size: 31.8))
                        .foregroundStyle(textColor)
                        .bold()
                        .frame(width: 81, height: 81)
                        .background(Color(uiColor: UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 0.3)))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                        .overlay(
                            ZStack{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.white, lineWidth: 4)
                                    .shadow(color: .white, radius: 30)
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.white, lineWidth: 4)
                                    .shadow(color: .white, radius: 30)
                                    .blur(radius: 9)
                            }
                            
                        )
                        .padding(.trailing, 150)

                    VStack{
                        Image("flora3")
                            .padding(.leading, 150)
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 4)
                                .shadow(color: .white, radius: 30)
                                .frame(width: 346, height: 135)
                            VStack{
                                Text("You can choose the falling blocks by touching on them.")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.semibold)
                                    .font(Font.custom("MusticaPro-SemiBold", size: 22))
                                    .frame(width: 290, height: 71)
                                
                                HStack{
                                    
                                    NavigationLink(destination: OnboardingView6(gameData: GameController()), label: {
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

                    }.padding(.bottom, 230)
                    
                }
                
            }
            .ignoresSafeArea()
            
        }
        .navigationBarBackButtonHidden(true)

    }

    
    
}
    #Preview {
        OnboardingView3()
    }

