//
//  GameData.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 20/01/23.
//

import Foundation


@Observable class GameController {
    
    var score: Int = 0 // Pontuação
    var operation: String = "+" // Operação Selecionada
    var objective: Float = 0
    var useNumbers: [Float] = []
    var noiseNumbers: [Float] = []
    var maxAttempt: Int = 0
    var blockQuantityOnScreen: Int = 0
    
    var objects: [GameObject] = []
    var number1 : Float = 0
    var number2 : Float = 0
    var returnBlock: Float = 0
    
    var newBlocks: [Float] = []
    
    
    func startBlock() {
        createBlock()
    }
    
    func startBlock(_ num: Float){
        createBlockNum(num)
       
    }
    
    func createBlock(){
        create(factory: BlockFactory())
    }
    
    func createBlockNum(_ num: Float){
        createNum(factory: BlockFactory(), num: num)
    }
    
    func createNum(factory: GOFactory, num: Float){
        
        let object: GameObject = factory.createGameObject(number: num)
        objects.append(object)
    }
    
    func create(factory: GOFactory){
        let object: GameObject = factory.createGameObject()
        objects.append(object)
    }
    
    func generateBlocks() {
        var resultNumber: Int = 0
        let operations: [String] = ["+", "-", "*", "/"]
        let blockQuantity: Int = Int.random(in: 2...3)
        maxAttempt = blockQuantity - 1
        print("Blocks: \(blockQuantity)")
        print("Max Tentativas: \(maxAttempt)")
        
        for count in 0...blockQuantity - 1 {
            
            if count == 0 {
                let chosenNumber: Int = Int.random(in: 1...20)
                useNumbers.append(Float(chosenNumber))
                resultNumber = chosenNumber
//                print(chosenNumber)
                continue
            }
            
            while true {
                let operation: String = operations.randomElement()!
                let chosenNumber: Int = Int.random(in: 1...20)
                
                if operation == "+" {
                    resultNumber = resultNumber + chosenNumber
//                    print("+")
                }
                else if operation == "-" {
                    resultNumber = resultNumber - chosenNumber
//                    print("-")
                }
                else if operation == "*" {
                    resultNumber = resultNumber * chosenNumber
//                    print("*")
                }
                else {
                    let aux: Float =  Float(resultNumber) / Float(chosenNumber)
                    
                    if aux.truncatingRemainder(dividingBy: 1) != 0 {
                        continue
                    }
                    
                    resultNumber = resultNumber / chosenNumber
//                    print("/")
                }
//                print(chosenNumber)
                useNumbers.append(Float(chosenNumber))
                break
            }
            
        }
        objective = Float(resultNumber)
        
        
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
        
    }
}
