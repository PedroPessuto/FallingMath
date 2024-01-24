//
//  OperationsGenerator.swift
//  GeracaoNumeros
//
//  Created by Raphael Iniesta Reis on 16/01/24.
//

import Foundation

func generator(amountOfNumbers: Int) -> Array<Float> {
    var number: Float = 0
    var numberArray: [Float] = []
    
    for _ in 1...amountOfNumbers {
        let intNumber = Int.random(in: 1..<51)
        number = Float(intNumber)
        numberArray.append(number)
    }
    
    return numberArray
}

func operationGenerator(call: Int) -> [Float : [Float]] {
    // Chama o gerador de Array com números aleatórios
    var array: [Float] = []
    
    if call <= 7 {
        array = generator(amountOfNumbers: call)
    } else {
        array = generator(amountOfNumbers: 7)
    }
    print(array)
    
    // Variáveis de todas as operações separadas
    var soma: [Float] = []
    var sub: [Float] = []
    var mult: [Float] = []
    var div: [Float] = []
    
    // Variáveis de transformação de Int -> Float
    var array1: Float = 0.0
    var array2: Float = 0.0
    
    // Array que salva todas as operações
    var operations: [String: [Float]] = [:]

    for i in 0...array.count - 1 {
        for j in 0...array.count - 1 {
            if(i != j) {
                soma.append(array[i] + array[j])
                sub.append(array[i] - array[j])
                if(array[i] * array[j] < 1000) {
                    mult.append(array[i] * array[j])
                }
                array1 = Float(array[i])
                array2 = Float(array[j])
                
                let num = array1 / array2
                
                if(num > 1) {
                    
                    // Formata o Float para uma casa decimal
                    let formatted = Float(String(format: "%.0f", num))
                    div.append(formatted!)
                }
            }
        }
    }
    
    operations["div"] = div
    operations["mult"] = mult
    operations["sub"] = sub
    operations["soma"] = soma
    
    let operationNames = ["div", "mult", "sub", "soma"]
    
    if let operationName = operationNames.randomElement() {
        let value = operations[operationName]!.randomElement()
//        print(operationName)
//        print(value!)
        
        let operation: [Float: [Float]] = [value!: array]
        
        return operation
    }
    
    // Retorna vazio caso dê erro
    return [0.0:[]]
}
