//
//  OnboardingView.swift
//  FallingMath
//
//  Created by Júlia Luz on 01/02/24.
//

import SwiftUI

struct OnboardingView1: View {
    @State var textColor: Color = Color(.white)
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("onboarding1")
                    .resizable()
                VStack{
                    Image("flora1")
                        .padding(.leading, 150)
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 4)
                            .shadow(color: .white, radius: 30)
                            .frame(width: 346, height: 120)
                        VStack{
                                Text("Hi, I'm Flora! Come on, we need your help!")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.semibold)
                                    .font(Font.custom("MusticaPro-SemiBold", size: 22))
                                    .frame(width: 290, height: 63)
                            
                            HStack{
                                NavigationLink(destination: OnboardingView2(), label: {
                                    HStack {
                                        Text("SKIP")
                                            .fontWeight(.semibold)
                                            .font(Font.custom("MusticaPro-SemiBold", size: 18))
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

            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)

    }
    
    
}
    #Preview {
        OnboardingView1()
    }

