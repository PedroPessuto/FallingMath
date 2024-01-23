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
    @State var operacoes: [String] = ["+","-","/","x"]
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
            HStack(spacing: 33){
                let s = String(format: "%.0f", gameData.number1)
                let s2 = String(format: "%.0f", gameData.number2)
                Text(s == "0" ? "" : s)
                    .font(.system(size: 31.8))
                    .bold()
                    .frame(width: 81, height: 81)
                    .background(s == "0" ? Color(red: 217/255, green:217/255, blue: 217/255) : Color(red: 244/255, green: 110/255, blue: 124/255))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 61, height: 61)
                        .foregroundStyle(.blue)
                    ZStack(alignment: .top){
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 61, height: 61)
                            .foregroundStyle(.mint)
                        HStack{
                            Text(operacoes[index])
                                .bold()
                                .font(.system(size: 50))
                                .padding(.bottom, 5)
                        }
                        .frame(width: 60, height: 60)
                        .padding(.bottom, btnPadding)
                        
                    }
                }
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
                    .background(s2 == "0" ? Color(red: 217/255, green:217/255, blue: 217/255) : Color(red: 244/255, green: 110/255, blue: 124/255))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
            }
            HStack{
                Spacer()
            }
            
        }
    }
}
