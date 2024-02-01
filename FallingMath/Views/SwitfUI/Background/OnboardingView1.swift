//
//  OnboardingView.swift
//  FallingMath
//
//  Created by Júlia Luz on 01/02/24.
//

import SwiftUI

struct OnboardingView: View {
    @State var textColor: Color = Color(.white)
    
    var body: some View {
        ZStack{
            Image("onboarding1")
                .resizable()
            VStack{
                
                Text("5")
                    .font(.system(size: 28))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.top, 80)
                    .overlay(
                        ZStack{
                            Path(roundedRect: CGRect(x: -60, y: 77, width: 135, height: 36), cornerRadii: RectangleCornerRadii(
                                topLeading: 13,
                                bottomLeading: 2,
                                bottomTrailing: 2,
                                topTrailing: 13))
                            .stroke()
                            .stroke(lineWidth: 3)
                            .fill(Color(uiColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)))
                            .shadow(color: .white, radius: 30)
                            
                            Path(roundedRect: CGRect(x: -63, y: 77, width: 140, height: 40), cornerRadii: RectangleCornerRadii(
                                topLeading: 13,
                                bottomLeading: 2,
                                bottomTrailing: 2,
                                topTrailing: 13))
                            .stroke()
                            .stroke(lineWidth: 13)
                            .fill(Color(uiColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)))
                            .shadow(color: .white, radius: 30)
                            .blur(radius: 9)
                        })
                
                Spacer()
                
                Text("5")
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
                
                Text("10")
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
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.white, lineWidth: 4)
                        .shadow(color: .white, radius: 30)
                        .frame(width: 346, height: 120)
                    VStack{
                        Text("Hi, I'm Flora! Come on, we need your help!")
                            .foregroundStyle(Color.white)
                        HStack{
                            Button("SKIP"){
                                
                            }
                           
                            
                            Image(systemName: "chevron.right")
                                .frame(width: 8, height: 14)
                                
                        }
                        .foregroundColor(Color(uiColor: UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 0.4)))
                    }
                }
                Spacer()
                
            }
            
        }
        .ignoresSafeArea()

    }
    
    
}
    #Preview {
        OnboardingView()
    }

