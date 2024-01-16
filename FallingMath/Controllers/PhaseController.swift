//
//  PhaseController.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 16/01/24.
//

import Foundation

@Observable class PhaseController {
    var targetNumber: Float? = nil
    var freeNumbers: [Block] = [Block(blockValue: 1), Block(blockValue: 3)]
    var lockedNumbers: [Block] = []
    
    func ganerateNewLevel()  {
        
        // Número Alvo
        var resultNumber: Float = 0
        
        // Números que vão ser gerados nesta horda
        var waveNumbers: [Block] = []
        var auxNumbers: [Float] = []
        
        // Verificar se vai ser utilizado números da tela
        let useNumberInScreen: Bool = Bool.random()
        
        // Verificar quantos números serão utilizados dos que já estão na tela
        if freeNumbers.count > 0 && useNumberInScreen {
            
            // Sorteia a quantidade de números que serão utilizados com um máximo de dois números
            var aux: Int =  freeNumbers.count

            if aux > 2 {
                aux = 2
            }
            // quantidade de números que vão ser utilizados da tela
            let quantityToUse: Int = Int.random(in: 0...aux)
            
            // Arrumar número repetidos e sorteados da lista
            print(quantityToUse)
            for _ in 0...quantityToUse {
                auxNumbers.append(freeNumbers[Int.random(in: 0...freeNumbers.count)].blockValue)
            }
        }
        
        // Váriavel para definir o mínimo de números que serão gerados além dos já existentes
//        var minGenerateWaveNumber: Int = 2
//        
//         Se utilizou números na tela
//        if waveNumbers.count > 0 {
//            minGenerateWaveNumber = 0
//        }
//        
//         Escolhe quantos números são gerados por horda
//        let quantityGenerateNumbers: Int = Int.random(in: minGenerateWaveNumber...5)
//        
//        var x: Int = 0
//        if auxNumbers.count % 2 != 0 {
//            x = 0
//        } else {
//            x = 1
//        }
//        
//        for count in 0...auxNumbers.count + x {
//            
//            print(auxNumbers[count])
//            print(auxNumbers[count + 1])
//            
//            // Só executa em numeros pares (para pegar o próximo número)
//            if count % 2 != 0 {
//                continue
//            }
//            
//            // Escolhe a operação
//            let operation: Int = Int.random(in: 1...4)
//            
//            
//            if operation == 1 {
//                resultNumber = auxNumbers[count] + auxNumbers[count + 1] + resultNumber
//            }
//            else if operation == 2 {
//                resultNumber = auxNumbers[count] - auxNumbers[count + 1] + resultNumber
//            }
//            else if operation == 3 {
//                resultNumber = auxNumbers[count] * auxNumbers[count + 1] + resultNumber
//            }
//            else {
//                let aux = auxNumbers[count] / auxNumbers[count + 1]
//                
//                // Se for quebrado
//                if aux.truncatingRemainder(dividingBy: 1) != 0 {
//                    let operation2: Int = Int.random(in: 1...3)
//                    
//                    if operation2 == 1 {
//                        resultNumber = auxNumbers[count] + auxNumbers[count + 1] + resultNumber
//                    }
//                    else if operation2 == 2 {
//                        resultNumber = auxNumbers[count] - auxNumbers[count + 1] + resultNumber
//                    }
//                    else {
//                        resultNumber = auxNumbers[count] * auxNumbers[count + 1] + resultNumber
//                    }
//                    
//                }
//            }
//            print(resultNumber)
//            
//    
//        }
//        
        
    }

}
