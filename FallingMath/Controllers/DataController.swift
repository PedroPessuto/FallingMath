//
//  DataController.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 09/02/24.
//

import Foundation
import SwiftData

@Observable class DataController {
    
    var context: ModelContext? = nil
    var items: [SavedData]? = nil
    
    
    // Atualiza o onBoarding
    func setOnBoarding(value: Bool) {
       
        if let items = self.items {
            if !items.isEmpty {
                items[0].onBoarding = value
            }
            do {
                if let context = self.context {
                    print("save")
                    try context.save()
                }
            }
            catch {
                print("Erro ao salvar")
            }
        }
        
    }
    

    init(context: ModelContext? = nil, items: [SavedData]? = nil) {
        self.context = context
        self.items = items
        if let items = self.items {
            if items.isEmpty {
                let item = SavedData(score: 0, sound: true, music: true, haptics: true, onBoarding: true)
                
                if let context = self.context {
                    context.insert(item)
                }
            }
        }
    }
    
}
