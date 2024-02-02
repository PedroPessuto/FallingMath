//
//  BackgroundView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 29/01/24.
//

import SwiftUI

struct BackgroundView: View {
    
    @Environment(GameController.self) private var gameController
    
    let color1 = Color(uiColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.3))
    //Azul
    let gradient1 = Color(red: 138/255, green: 208/255, blue: 228/255)
    let gradient2 = Color(red: 81/255, green: 127/255, blue: 221/255)
    //Vermelho
    let gradient3 = Color(red: 255/255, green: 51/255, blue: 69/255)
    let gradient4 = Color(red: 255/255, green: 137/255, blue: 90/255)
    //Ciano
    let gradient5 = Color(red: 40/255, green: 168/255, blue: 165/255)
    let gradient6 = Color(red: 74/255, green: 185/255, blue: 168/255)
    //Vermelho
    let gradient7 = Color(red: 167/255, green: 199/255, blue: 67/255)
    let gradient8 = Color(red: 233/255, green: 161/255, blue: 56/255)
    
    @State var gradientColors: [Color] = []
    var body: some View {
        // Fazer lógica para mudar imagem e cor de fundo de acordo com a operação
        ZStack {
//            Color.black
            RadialGradient(colors: gradientColors, center: UnitPoint(x: 0, y: 0), startRadius: 100, endRadius: 800)
        }
        .ignoresSafeArea()
        .onChange(of: gameController.operation){
            
            withAnimation {
                switch gameController.operation {
                case "+":
                    gradientColors = [gradient1, gradient2]
                case "-":
                    gradientColors = [gradient3, gradient4]
                case "x":
                    gradientColors = [gradient5, gradient6]
                case "/":
                    gradientColors = [gradient7, gradient8]
                default:
                    print("Cor erro")
                }
            }
        }
        .onAppear(){
            gradientColors = [gradient1, gradient2]
        }
    }
}
