//
//  OnboardingView2.swift
//  FallingMath
//
//  Created by Júlia Luz on 01/02/24.
//



import SwiftUI

struct OnboardingView2: View {
    @State var textColor: Color = Color(.white)
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("onboarding2")
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
                    VStack{
                        Image("flora2")
                            .padding(.leading, 150)
                            .padding(.bottom, 20)
                        
                        
                        
                        
                        VStack{
                            Text("This is the number you should reach.")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .font(Font.custom("MusticaPro-SemiBold", size: 22))
                                .frame(width: 290, height: 71)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.white, lineWidth: 4)
                                        .shadow(color: .white, radius: 30)
                                        .frame(width: 346, height: 120)
                                    HStack{
                                        
                                        NavigationLink(destination: OnboardingView3(), label: {
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
                                    .padding(.top, 70)
                                    .foregroundColor(Color(uiColor: UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 0.4)))
                                }
                        }
                        .padding(.bottom, 250)
                        
                        
                        
                    }
                    
                }
            }                .ignoresSafeArea()
            
                .navigationBarBackButtonHidden(true)
        }
    }
    
    
}
#Preview {
    OnboardingView2()
}

