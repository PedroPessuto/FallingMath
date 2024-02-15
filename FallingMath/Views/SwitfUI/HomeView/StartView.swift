//
//  StartView.swift
//  FallingMath
//
//  Created by Rafael Carreira on 15/02/24.
//

import SwiftUI
import SwiftData

struct StartView: View {
    @Environment(GameController.self) private var gameController
    @Environment(\.modelContext) private var context
    @Query private var items: [SavedData]
    
    var color1 = Color(red: 131/255, green: 197/255, blue: 223/255)
    var color2 = Color(red: 158/255, green: 205/255, blue: 198/255)
    var color3 = Color(red: 182/255, green: 202/255, blue: 129/255)
    var color4 = Color(red: 239/255, green: 115/255, blue: 127/255)
    
    @State private var scale = 1.0
    @State var Changesize: Bool = false
    @State var degrees: Double = 0
    var timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            
            VStack{
                VStack(spacing: 0){
                    Image("Logo")
                        .resizable()
                        .frame(width: 283.09, height: 165.69)
                        .rotationEffect(.degrees(degrees))
                        .animation(.linear(duration: 1), value: degrees)
                    
                    ZStack{
                        VStack(spacing: -100){
                            HStack(spacing: -50){
                                Image("Walter")
                                    .resizable()
                                    .frame(width: 227.71, height:199.8)
                                
                                
                                
                                Image("Celsio")
                                    .resizable()
                                    .frame(width: 219.26, height:276.09)
                            }
                            
                            
                            HStack(spacing: -80){
                                Image("Windy")
                                    .resizable()
                                    .frame(width: 240.73, height:286.73)
                                Image("Flora")
                                    .resizable()
                                    .frame(width: 297.42, height:298.53)
                            }.zIndex(-1)
                        }
                        
                    }
                    .padding(.bottom, 50)
                    Text("TOQUE PARA INICIAR")
                        .font(.custom("MusticaPro-SemiBold", size: 16))
                        .foregroundStyle(.white)
                        .kerning(2)
                        .scaleEffect(scale)
                        .animation(.linear(duration: 1), value: scale)
                        .padding(.bottom, 20)
                    
                }
                
            }
            .frame(height: 839)

            .onReceive(timer, perform: { _ in
                
                
                if Changesize{
                    degrees += 2
                    scale += 0.1
                    if scale >= 1.5{
                        Changesize = false
                    }
                   
                }
                else{
                    degrees -= 2
                    scale -= 0.1
                    if scale <= 1{
                        Changesize = true
                    }
                }
            }
            )
            
        }
        .ignoresSafeArea()
        .background(Gradient(colors: [color1, color2, color3, color4]))
        
        .onTapGesture {
            if items.isEmpty{
                addItem(score: 0, sound: true, music: true, haptics: true, onBoarding: true)
              
            }
//            gameController.configHaptics = items[0].haptics
           
//            if items[0].onBoarding{
//                gameController.configScreenName = "tutorial"
//            }else{
                gameController.configScreenName = "tutorial"
//            }
        }
    }
    func addItem(score: Int, sound: Bool, music: Bool, haptics: Bool, onBoarding: Bool) {
        
        let item = SavedData(score: score, sound: sound, music: music, haptics: haptics, onBoarding: onBoarding)
        
        context.insert(item)
        print(items)
    }
}

#Preview {
    StartView()
        .environment(GameController())
}
