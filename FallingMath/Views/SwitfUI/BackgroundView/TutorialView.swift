//
//  OnboardingView.swift
//  FallingMath
//
//  Created by Júlia Luz on 07/02/24.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    
    @Environment(GameController.self) private var gameController
    @Environment(DataController.self) private var dataController
 
    var texts: [String] = ["Oi, sou a Flora! Vamos lá, nós precisamos da sua ajuda!", "Esse é o número que você precisa chegar.", "Você pode escolher os blocos caindo tocando neles.", "E tocar no botão circular para trocar a operação.", "Perfeito!", "O equilíbrio dos 4 elementos está perdendo o controle", "Não deixe os blocos completarem a tela e proteja nossa terra do desequilíbrio!"]
    
    var characters: [String] = ["personagem1", "personagem2", "personagem3", "personagem4", "personagem5", "personagem6", "personagem7"]
    
    var backgrounds: [String] = ["fundo1", "fundo2", "fundo3", "fundo4", "fundo5", "fundo6", "fundo7"]
    
    @State var index: Int = 0
    
    //Wheel
    @State var degreesInfinity: Double = 0
    var degrees: [Double] = [0, 90, 180, 270]
    @State var index1: Int = 0
    @State var operacoes: [String] = ["+","-","x","/"]
    @State var textColor: Color = Color(.white)
    
    var body: some View {
        ZStack{
            Image("\(backgrounds[index])")
                .resizable()
            
            VStack(spacing: 0){
                
                Image("\(characters[index])")
                    .padding(.leading, 150)
                VStack{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 4)
                        .frame(width: 346, height: 160)
                        .foregroundColor(.white)
                        .overlay{
                            VStack{
                                Text(texts[index])
                                    .font(.custom("MusticaPro-SemiBold", size: 22))
                                    .foregroundColor(.white)
                                    .padding()
                                HStack{
                                    Button(action: {
                                        if index < characters.count - 1{
                                            index += 1
                                        }
                                        
                                       
                                        if index == 6 {
                                            print(6)
                                            dataController.setOnBoarding(value: false)
                                            gameController.configScreenName = "game"
                                            gameController.startGame()
                                        }
                                        
                                    }, label: {
                                        Text(index == 6 ? "JOGAR" : index == 3 || index == 2 ? "" : "PULAR")
                                            .font(.custom("MusticaPro-SemiBold", size: 14))
                                            .foregroundColor(.gray)
                                        if index != 2 && index != 3{
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.custom("MusticaPro-SemiBold", size: 10))
                                        }
                                    })
                                }
                                .padding(.leading, 250)
                                .padding(.bottom, 10)
                                
                            }
                        }
                    
                    
                }
                
            }
            .animation(.easeInOut(duration: 0.5), value: index)
            if index == 3 || index == 4{
                VStack{
                    Spacer()
                    ZStack {
                        
                        HStack(spacing: 0) {
                            ZStack{
                                Image(degrees[index1] == 90 ? "onLeft" : "offLeft")
                                if degrees[index1] == 90 {
                                    Image("minus")
                                        .rotationEffect(.degrees(90))
                                }
                                
                            }
                            
                            VStack{}
                                .frame(width: 82,height: 82)
                            
                            ZStack{
                                Image(degrees[index1] == 270 ? "onRight" : "offRight")
                                if degrees[index1] == 270 {
                                    Image("divide")
                                        .rotationEffect(.degrees(90))
                                }
                                
                            }
                        }
                        VStack(spacing: 0){
                            ZStack{
                                Image(degrees[index1] == 0 ? "onUp" : "offUp")
                                if degrees[index1] == 0 {
                                    Image("plus")
                                }
                                
                            }
                            ZStack{
                                Image("Center")
                                    .resizable()
                                    .frame(width: 84, height: 84)
                                    .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                                        
                                        if pressing {
                                            if index == 3{
                                                if index1 < operacoes.count - 1{
                                                    index1 += 1
                                                    degreesInfinity += 90
                                                    index += 1
                                                }
                                                else {
                                                    index1 = 0
                                                    degreesInfinity += 90
                                                    index += 1
                                                }
                                            }
                                        }
                                    }, perform: {})
                                    .rotationEffect(.degrees(-degreesInfinity))
                                    .animation(.bouncy(duration: 0.5), value: index1)
                               
                            }
                            ZStack{
                                Image(degrees[index1] == 180 ? "onDown" : "offDown")
                                if degrees[index1] == 180 {
                                    Image("multiplier")
                                        .rotationEffect(.degrees(90))
                                }
                                
                            }
                        }
                    }
                    .rotationEffect(.degrees(degreesInfinity))
                    .animation(.bouncy(duration: 0.5), value: index1)
                    .offset(y: 26)
                    
                    
                }
            }
            if index == 2{
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button{
                            index += 1
                        } label: {
                            VStack{
                                
                            }
                            .frame(width: 76, height: 76)
                        }
                        .padding(.trailing, 40)
                        .padding(.top, 40)
                        Spacer()
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                }
                
            }
        }
        .ignoresSafeArea()
    }
}
