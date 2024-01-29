//
//  OverlayView.swift
//  TesteSpriteKit
//
//  Created by Pedro Cacique on 14/12/23.
//

import Foundation
import SwiftUI

struct OverlayView: View {
    var gameData: GameData
    @State var btnPadding: CGFloat = 15
    @State var btnHeight: CGFloat = 51
    @State var index: Int = 0
    @State var operacoes: [String] = ["+","/","x","-"]
    var body: some View {
        //        VStack{
        //            HStack{
        //                Spacer()
        //            }
        //            Text("\(gameData.score)")
        //            Spacer()
        //        }
        VStack{
            Spacer()
            HStack(spacing: 0){
                let s = String(format: "%.0f", gameData.number1)
                let s2 = String(format: "%.0f", gameData.number2)
                Text(s == "0" ? "" : s)
                    .font(.system(size: 31.8))
                    .bold()
                    .frame(width: 81, height: 81)
                    .background(s == "0" ? .gray: .white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                        
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.white, lineWidth: 4)
                    )
                
                WheelView()
                    .offset(x:0, y:60)
                    .zIndex(-1)
                    .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                        if pressing{
                            btnPadding = 0
                            btnHeight = 51
                            if index < operacoes.count - 1{
                                index += 1
                                gameData.operacao = operacoes[index]
                            }else{
                                index = 0
                                gameData.operacao = operacoes[index]
                                
                            }
                        } else{
                            btnPadding = 15
                            btnHeight = 61
                        }
                    }, perform: {})
                
                Text(s2 == "0" ? "" : s2)
                    .font(.system(size: 31.8))
                    .bold()
                    .frame(width: 81, height: 81)
                    .background(s2 == "0" ? .gray: .white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.white, lineWidth: 4)
                    )
                
            }
            HStack{
                Spacer()
            }
            
        }
    }
}
