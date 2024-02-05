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
        
        VStack (spacing: 20) {
            
            // ProgressBar
            ProgressBarView()
            
            ZStack {
                
                // Roda das operacoes
                WheelView()
                
                // Local dos numeros
                VStack {
                    HStack {
                        
                        // Numero 1
                        NumberBlockOperation(formatedNumber: formatedNumber1)
                            .onTapGesture {
                                if gameController.number1 != nil {
                                    if formatedNumber1 != nil {
                                        gameController.returnBlock = gameController.number1!
                                        gameController.number1 = nil
                                    }
                                }
                            }
                            .onChange(of: gameController.number1) { _, _ in
                                gameController.doOperation()
                            }
                        
                        Spacer()
                        
                        // Numero 2
                        NumberBlockOperation(formatedNumber: formatedNumber2)
                            .onTapGesture {
                                if gameController.number2 != nil {
                                    if formatedNumber2 != nil {
                                        gameController.returnBlock = gameController.number2!
                                        gameController.number2 = nil
                                    }
                                }
                            }
                            .onChange(of: gameController.number2) { _, _ in
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
