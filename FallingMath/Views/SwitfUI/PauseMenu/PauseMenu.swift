//
//  PauseMenu.swift
//  FallingMath
//
//  Created by Raphael Iniesta Reis on 07/02/24.
//

import SwiftUI

struct PauseMenu: View {
    
    @Environment(GameController.self) var gameController
    @State var isHaptic: Bool = true
    
    var body: some View {
        VStack {
            Text("PAUSED")
                .font(.custom("Mustica Pro", size: 27))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Divider()
                .padding(.horizontal, 60)
            
            HStack {
                Image(systemName: "music.note")
                    .foregroundStyle(.white)
                
                Toggle(isOn: .constant(true), label: {
                    Text("MUSIC")
                })
                .foregroundStyle(.white)
                .tint(.clear)
            }
            .padding(.horizontal, 70)
            .padding(.top, 50)
            .padding(.bottom, 30)
            
            HStack {
                Image(systemName: "music.note")
                    .foregroundStyle(.white)
                
                Toggle(isOn: .constant(true), label: {
                    Text("SOUND")
                })
                .foregroundStyle(.white)
                .tint(.clear)
            }
            .padding(.horizontal, 70)
            .padding(.bottom, 30)
            
            HStack {
                Image(systemName: "iphone.gen3.radiowaves.left.and.right")
                    .foregroundStyle(.white)
                
                Toggle(isOn: $isHaptic, label: {
                    Text("VIBRATION")
                })
                .foregroundStyle(.white)
                .tint(.clear)
                .onChange(of: gameController.configHaptics) { _, newValue in
                    isHaptic = newValue
                }
                .onChange(of: isHaptic) { _, newValue in
                  
                    gameController.configHaptics = newValue
                }
                .onAppear {
                    isHaptic = !gameController.configHaptics
                    isHaptic = gameController.configHaptics
                }
                
//                Text("VIBRATION")
                
//                Button {
//                    gameController.configHaptics.toggle()
//                } label: {
//                    Image(systemName: gameController.configHaptics ? "checkmark.square" : "square")
//                }
            }
            .padding(.horizontal, 70)
            
            Button {
//                gameController.configIsPaused.toggle()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .padding(.horizontal, 10)
                        .font(.title)
                    
                    Text("RESUME")
                        .padding(.horizontal, 10)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 195, height: 68)
                .background(.ultraThinMaterial)
                .clipShape(Capsule())
                .overlay {
                    Capsule()
                        .stroke(.white, lineWidth: 4, antialiased: true)
                }
                .padding(.top, 50)
                .tint(.white)
            }
            
        }
        .frame(width: 334, height: 424)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 35))
        .overlay {
            RoundedRectangle(cornerRadius: 35)
                .stroke(.white, lineWidth: 4, antialiased: true)
        }
    }
}

//#Preview {
//    PauseMenu()
//}
