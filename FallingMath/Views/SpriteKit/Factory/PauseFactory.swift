//
//  PauseFactory.swift
//  FallingMath
//
//  Created by Raphael Iniesta Reis on 01/02/24.
//

import Foundation
import SpriteKit
import SwiftUI

class PauseFactory: GOFactory{
    
    func createGameObject() -> GameObject {
        
        let pause: PauseNode = PauseNode(position: CGPoint(x: 363, y: 800))
        
        
        return pause
    }
    
    func createGameObject(number: Float) -> GameObject {
        let pause: PauseNode = PauseNode(position: CGPoint(x: 63.5, y: 950))
        return pause
    }
}
