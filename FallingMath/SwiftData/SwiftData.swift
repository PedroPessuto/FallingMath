//
//  SwiftData.swift
//  FallingMath
//
//  Created by Raphael Iniesta Reis on 08/02/24.
//

import Foundation
import SwiftData

@Model
class SavedData: Identifiable {
    var score: Int
    var sound: Bool
    var music: Bool
    var haptics: Bool
    var onBoarding: Bool
    
    init(score: Int, sound: Bool, music: Bool, haptics: Bool, onBoarding: Bool) {
        self.score = 0
        self.sound = true
        self.music = true
        self.haptics = true
        self.onBoarding = true
    }
}
