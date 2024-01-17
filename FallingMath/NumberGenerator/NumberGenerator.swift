//
//  OperationsGenerator.swift
//  GeracaoNumeros
//
//  Created by Raphael Iniesta Reis on 16/01/24.
//

import Foundation

func generator() -> Array<Int> {
    var number: Int = 0
    var numberArray: [Int] = []
    
    for _ in 1...10 {
        number = Int.random(in: 1..<51)
        numberArray.append(number)
    }
    
    return numberArray
}

func operationGenerator() {
    // Chama o gerador de Array com números aleatórios
    let array: [Int] = generator()
    
    // Variáveis de todas as operações separadas
    var soma: [String] = []
    var sub: [String] = []
    var mult: [String] = []
    var div: [String] = []
    
    // Variáveis de transformação de Int -> Float
    var array1: Float = 0.0
    var array2: Float = 0.0
    
    // Array que salva todas as operações
    var operations: [Array<String>] = []
    
    // Imprime o Array inicial que será usado para fazer as operações
    print(array)
    for i in 0...array.count - 1 {
        for j in 0...array.count - 1 {
            if(i != j) {
                soma.append(String(array[i] + array[j]))
                sub.append(String(array[i] - array[j]))
                mult.append(String(array[i] * array[j]))
                array1 = Float(array[i])
                array2 = Float(array[j])
                let num = array1 / array2
                
                // Formata o Float para uma casa decimal
                let formatted = String(format: "%.1f", num)
                div.append(formatted)
            }
        }
    }
    
    operations.append(soma)
    operations.append(sub)
    operations.append(mult)
    operations.append(div)
    
    print(operations)
    
    
//    return [1,2,3,4]
}
