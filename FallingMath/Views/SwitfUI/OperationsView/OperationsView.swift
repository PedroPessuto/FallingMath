//
//  OverlayView.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 29/01/24.
//

import Foundation
import SwiftUI

struct OperationsView: View {
    
    @Environment(GameController.self) private var gameController
    
    @State var btnPadding: CGFloat = 15
    @State var btnHeight: CGFloat = 51
    @State var index: Int = 0
    @State var operacoes: [String] = ["+","-","x","/"]
    
    var azul = Color(red: 81/255, green: 127/255, blue: 221/255)
    var vermelho = Color(red: 1, green: 127/255, blue: 96/255)
    var ciano = Color(red: 79/255, green: 200/255, blue: 187/255)
    var verde = Color(red: 221/255, green: 175/255, blue: 73/255)
    
    @State var textColor: Color = Color(.white)
    
    var formatedNumber1: String? {
        var num: String? = nil
        if gameController.number1 != nil  {
            num = gameController.formatNumber(gameController.number1!)
        }
        return num
    }
    
    var formatedNumber2: String? {
        var num: String? = nil
        if gameController.number2 != nil  {
            num = gameController.formatNumber(gameController.number2!)
            
        }
        return num
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                
                // Roda das operacoes
                WheelView()
                    .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                        if pressing {
                            btnPadding = 0
                            btnHeight = 51
                            if index < operacoes.count - 1{
                                index += 1
                                gameController.operation = operacoes[index]
                            }
                            else {
                                index = 0
                                gameController.operation = operacoes[index]
                            }
                        } else{
                            btnPadding = 15
                            btnHeight = 61
                        }
                    }, perform: {})
                
                // Local dos numeros
                VStack {
                    HStack {
                        
                        // Numero 1
                        NumberBlockOperation(formatedNumber: formatedNumber1)
                            .onTapGesture {
                                if formatedNumber1 != nil {
                                    gameController.returnBlock = gameController.number1!
                                    gameController.number1 = nil
                                }
                            }
                        
                        Spacer()
                        
                        // Numero 2
                        NumberBlockOperation(formatedNumber: formatedNumber2)
                            .onTapGesture {
                                if formatedNumber2 != nil {
                                    gameController.returnBlock = gameController.number2!
                                    gameController.number2 = nil
                                }
                            }
                            .onChange(of: gameController.number2) { _, newValu_e in
                                gameController.doOperation()
                            }
                    }
                    Spacer()
                }
            }
        }
        .padding(.top)

    }
}
