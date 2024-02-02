//
//  SwiftUIView.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 23/01/24.
//

import SwiftUI

struct WheelView: View {
    var degreess: [Double] = [0, 90, 180, 270]
    @State var index: Int = 0
    
    var body: some View {
        ZStack {
            
            HStack(spacing: 0) {
                ZStack{
                    Image(degreess[index] == 90 ? "onLeft" : "offLeft")
                    Image(degreess[index] == 90 ? "minus" : "")
                        .rotationEffect(.degrees(90))
                }
                
                VStack{}
                    .frame(width: 60,height: 60)
                
                ZStack{
                    Image(degreess[index] == 270 ? "onRight" : "offRight")
                    Image(degreess[index] == 270 ? "divide" : "")
                        .rotationEffect(.degrees(90))
                }
            }
            VStack(spacing: 0){
                ZStack{
                    Image(degreess[index] == 0 ? "onUp" : "offUp")
                    Image(degreess[index] == 0 ? "plus" : "")
                        
                }
                Image("Center")
                    .onTapGesture {
                        if Int(index) == degreess.count - 1{
                            index = 0
                        }else{
                            index += 1
                        }
                    }
                ZStack{
                    Image(degreess[index] == 180 ? "onDown" : "offDown")
                    Image(degreess[index] == 180 ? "multiplier" : "")
                        .rotationEffect(.degrees(90))
                }
            }
        }
        .rotationEffect(.degrees(degreess[index]))
        .animation(.bouncy(duration: 0.5), value: index)
    }
}
