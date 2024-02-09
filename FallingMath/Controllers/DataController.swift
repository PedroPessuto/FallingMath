//
//  DataController.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 09/02/24.
//

import Foundation
import SwiftData
//
//class DataController {
//    
//    var context: ModelContext
//    var items: [SavedData]
//    
//    // Vai no botão de play
//    func firstPlay() {
//        if items.isEmpty {
//            addItem(score: 0, sound: true, music: true, haptics: true, onBoarding: true)
//        }
//    }
//    
//    func addItem(score: Int, sound: Bool, music: Bool, haptics: Bool, onBoarding: Bool) {
//        
//        let item = SavedData(score: score, sound: sound, music: music, haptics: haptics, onBoarding: onBoarding)
//        
//        context.insert(item)
//    }
//    
//    // Rodado toda vez que terminar o jogo
//    func updateItem(_ item: SavedData) {
//            item.onBoarding = false
//            try? context.save()
//        }
//    
//}
