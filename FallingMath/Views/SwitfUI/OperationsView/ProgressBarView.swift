//
// ProgressBarView.swift
// FallingMath
//
// Created by Rafael Carreira on 01/02/24.
//

import SwiftUI

struct ProgressBarView: View {
    
    @Environment(GameController.self) private var gameController
    
  @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
  let totalValue: Float = 1
  @State var progressValue: CGFloat = 0
  var color: [Color] = [.blue,.clear]
  @State var index: Int = 0
    
  var body: some View {
    ZStack(alignment: .leading){
//      RoundedRectangle(cornerRadius: 100)
//        .stroke()
//        .frame(width: 350, height: 10)
//        .foregroundStyle(.gray)
//      RoundedRectangle(cornerRadius: 100)
//        .frame(width: (progressValue/CGFloat(totalValue)) * 350, height: 10)
//        .foregroundStyle(color[index])
//        .onReceive(timer){ _ in
//          if Float(progressValue) > totalValue{
//            index = 1
//            progressValue = 0
//            timer.upstream.connect().cancel()
//          }else{
//            withAnimation{
//              progressValue += 0.1
//            }
//          }
//        }
    }
   
//    .onAppear{
//      timer.upstream.connect().cancel()
//    }
  }
}
