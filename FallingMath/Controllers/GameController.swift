//
//  GameData.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 20/01/23.
//

import Foundation


@Observable class GameController {
    
    var objects: [GameObject] = []
    
    // Game
    var score: Int = 0 // Pontuação
    var objective: Float = 0 // N[umero objetivo
    var attempts: Int = 0 // Tentativas para atingir o  objetivo
    
    // Generation
    var useNumbers: [Float] = []
    var maxAttempt: Int = 0
    
    // Operation
    var operation: String = "+" // Operação Selecionada
    var number1 : Float? = nil
    var number2 : Float? = nil
    var returnBlock: Float? = nil
    
    // SpriteKit Integration
    var gameScreenSize: CGSize? = nil
    
    // Config
    var configScreenName: String = "game"
    var configIsPaused: Bool = false
    
    func startBlock() {
        createBlock()
    }
    
    func startBlock(_ num: Float){
        createBlockNum(num)
       
    }
    
    
    //Creates
    
    func createPauseButtom() {
        create(factory: PauseFactory())
    }
    
    func createResumeButtom() {
        create(factory: ResumeFactory())
    }
    
    func createBlock(){
        create(factory: BlockFactory())
    }
    
    func createBlockNum(_ num: Float){
        createNum(factory: BlockFactory(), num: num)
    }
    
    func createNum(factory: GOFactory, num: Float){
        let object: GameObject = factory.createGameObject(number: num, screenSize: gameScreenSize!)
        objects.append(object)
    }
    
    func create(factory: GOFactory){
        let object: GameObject = factory.createGameObject()
        objects.append(object)
    }
    
    // Função para resetar as variáveis
    func resetGame() {
        self.score = 0
        self.objective = 0
        self.useNumbers = []
        self.maxAttempt = 0
        self.operation = "+"
        self.number1 = nil
        self.number2 = nil
        self.returnBlock = nil
    }
    
    func doOperation() {
        var number: Float = 0

        // Faz a operação quando há (2 números selecionados)
        if let num2 = self.number2 {
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                if let num1 = self.number1, let _ = self.number2 {
                    switch self.operation {
                    case "+":
                        number = num1 + num2
                    case "-":
                        number = num1 - num2
                    case "/":
                        number = num1 / num2
                    case "x":
                        number = num1 * num2
                    default:
                        print("Operação inválida")
                    }
                    
                    self.number1 = nil
                    self.number2 = nil
                    
                    
                    // Se ele acertou
                    if self.objective == number {
                        self.generateBlocks()
                        self.attempts = 0
                        self.maxAttempt = 0
                        self.score = self.score + 1
                    }
                    // Se errou
                    else {
                        
                        // Aumenta o numero de tentativas
                        self.attempts = self.attempts + 1
                        
                        // Se atingiu o limite de tentativas
                        if self.maxAttempt >= self.attempts {
                            self.attempts = 0
                            self.generateBlocks()
                        }
                        
                        // gera bloco errado
                        if number <= -1 || number > 0.009 {
                            self.useNumbers.append(number)
                        }
                    }
                    
                }
               
            }
            
           
        }
    }
    
    // Função para iniciar o jogo
    func startGame() {
        self.resetGame()
        self.generateBlocks()
    }
    
    // Função para formatar os números (retirar decimais inuteis)
    func formatNumber(_ number: Float) -> String {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(number))"
        }
       
        return String(number.formatted(.number.precision(.fractionLength(2))))
    }
    
    // Função para gerar blocos com um novo objetivo
    func generateBlocks() {
        var resultNumber: Int = 0
        let operations: [String] = ["+", "-", "*", "/"]
        let blockQuantity: Int = 2
        maxAttempt = blockQuantity - 1
        
        for count in 0...blockQuantity - 1 {
            
            // Na primeira vez vai escolher um número aleatório
            if count == 0 {
                var chosenNumber: Int = Int.random(in: -20...20)
                
                // Verifica se o numero é diferente de zero (0)
                while chosenNumber == 0 {
                    chosenNumber = Int.random(in: -20...20)
                }
                
                // Adiciona o numero na lista para renderizacao
                useNumbers.append(Float(chosenNumber))
                
                // Iguala ao resultado o chosenNumber
                resultNumber = chosenNumber
                
                // Pula para próxima execução do loop
                continue
            }
            
            while true {
                let operation: String = operations.randomElement()!
                let chosenNumber: Int = Int.random(in: 1...20)
                
                if operation == "+" {
                    resultNumber = resultNumber + chosenNumber
                }
                else if operation == "-" {
                    resultNumber = resultNumber - chosenNumber
                }
                else if operation == "*" {
                    resultNumber = resultNumber * chosenNumber
                }
                else {
                    let aux: Float =  Float(resultNumber) / Float(chosenNumber)
                    
                    if aux.truncatingRemainder(dividingBy: 1) != 0 {
                        continue
                    }
                    
                    resultNumber = resultNumber / chosenNumber
                }
                useNumbers.append(Float(chosenNumber))
                break
            }
            
        }
        objective = Float(resultNumber)
        
    }
}



//        let numbersToUseQuantity: Int = Int.random(in: 2...3)
//
//        // Gerar ruído
//        let generateNoise: Bool = false
//
//        if generateNoise {
//            let noiseNumberQuantity: Int = Int.random(in: 1...2)
//
//            for _ in 0...noiseNumberQuantity {
//                let number = Int.random(in: 1...20)
//                noiseNumbers.append(Float(number))
//            }
//        }
//
//        var resultNumber: Int = 0
//
//        // Fazer operação e guaradar números utilizados
//        for count in 0...numbersToUseQuantity - 1 {
//
//            // Primeiro Numero
//            if count == 0 {
//                resultNumber = Int.random(in: 1...10)
//                useNumbers.append(Float(resultNumber))
//                continue
//            }
//
//            // Faz a operacao
//            let chosenNumber: Int = Int.random(in: 1...10)
//            let chosenOperation: Int = Int.random(in: 0...2)
//
//            if chosenOperation == 0 {
//                resultNumber = resultNumber + chosenNumber
//            } else if chosenOperation == 1 {
//                resultNumber = resultNumber - chosenNumber
//            } else if chosenOperation == 2 {
//                resultNumber = resultNumber * chosenNumber
//            } else if chosenOperation == 3 {
//                resultNumber = resultNumber / chosenNumber
//            }
//            useNumbers.append(Float(chosenNumber))
//        }

// Usar ruído
//        var count: Int = 0
//        for aux in objects {
//            if aux.node.name == "block" {
//                count = count + 1
//                if count > 3 {
//                    break
//                }
//            }
//        }
//
//        if count > 1 {
//            let useNoiseNumber: Int = Int.random(in: 1...count)
//
//            for count in 0...useNoiseNumber {
//
//                // Primeiro Numero
//                if count == 0 {
//                    resultNumber = Int.random(in: 1...10)
//                    useNumbers.append(Float(resultNumber))
//                    continue
//                }
//
//                // Faz a operacao
//                let chosenNumber: Int = Int.random(in: 1...10)
//                let chosenOperation: Int = Int.random(in: 0...2)
//
//                if chosenOperation == 0 {
//                    resultNumber = resultNumber + chosenNumber
//                } else if chosenOperation == 1 {
//                    resultNumber = resultNumber - chosenNumber
//                } else if chosenOperation == 2 {
//                    resultNumber = resultNumber * chosenNumber
//                }
//                else if chosenOperation == 3 {
//                    resultNumber = resultNumber / chosenNumber
//                    //                Verficar se nao da quebrado
//                    //                let isInt: Float = Float(resultNumber) / Float(chosenNumber)
//                    //                if isInt.truncatingRemainder(dividingBy: 1) != 0 {
//                    //                    chosenNumber = Int.random(in: 1...20)
//                    //                }
//                }
//                useNumbers.append(Float(chosenNumber))
//            }
//        }

//        objective = Float(resultNumber)
