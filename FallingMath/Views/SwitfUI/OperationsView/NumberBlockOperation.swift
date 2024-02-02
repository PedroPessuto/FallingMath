//
//  NumberBlockOperation.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 02/02/24.
//

import SwiftUI

struct NumberBlockOperation: View {
    
    @Environment(GameController.self) private var gameController
    
    var formatedNumber: String?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    formatedNumber != nil ? Color.white : Color(uiColor: UIColor(red: 207/256, green: 207/256, blue: 207/256, alpha: 0.1))
                )
                .stroke(
                    formatedNumber != nil ? Color.white : Color(red: 1, green: 1, blue: 1, opacity: 0.5), lineWidth: 4)
                .frame(width: 80, height: 80)

           
                Text(formatedNumber ?? "")
                    .foregroundColor(
                        gameController.operation == "+" ? Color(red: 81/255, green: 127/255, blue: 221/255) : gameController.operation == "-" ? Color(red: 1, green: 127/255, blue: 96/255) : gameController.operation == "x" ? Color(red: 79/255, green: 200/255, blue: 187/255) : Color(red: 221/255, green: 175/255, blue: 73/255)
                    )
                    .font(.system(size: 31.8))
                    .bold()
                
        }
    }
}
