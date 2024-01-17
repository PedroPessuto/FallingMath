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
    
    for _ in 1...5 {
        number = Int.random(in: 1..<51)
        numberArray.append(number)
    }
    
    return numberArray
}

func operationGenerator() {
    // Chama o gerador de Array com números aleatórios
    let array: [Int] = generator()
    
    // Variáveis de todas as operações separadas
    var soma: [Int] = []
    var sub: [Int] = []
    var mult: [Int] = []
    var div: [Float] = []
    
    // Variáveis de transformação de Int -> Float
    var array1: Float = 0.0
    var array2: Float = 0.0
    
    // Imprime o Array inicial que será usado para fazer as operações
    print(array)
    for i in 0...array.count - 1 {
        for j in 0...array.count - 1 {
            if(i != j) {
                soma.append(array[i] + array[j])
                sub.append(array[i] - array[j])
                mult.append(array[i] * array[j])
                array1 = Float(array[i])
                array2 = Float(array[j])
                div.append(array1 / array2)
            }
        }
    }
    
    print("Soma: \(soma)")
    print("Subtração: \(sub)")
    print("Multiplicação: \(mult)")
    print("Divisão \(div)")
    
    
//    return [1,2,3,4]
}
