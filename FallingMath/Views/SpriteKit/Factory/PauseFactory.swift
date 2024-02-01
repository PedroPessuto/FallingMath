//
//  PauseFactory.swift
//  FallingMath
//
//  Created by Raphael Iniesta Reis on 01/02/24.
//

import Foundation
import SpriteKit

class PauseFactory: GOFactory{
    
    func createGameObject() -> GameObject {
        
        let pause: PauseNode = PauseNode(position: CGPoint(x: 250, y: 700))
        
        
        return pause
    }
    
    func createGameObject(number: Float) -> GameObject {
        let pause: PauseNode = PauseNode(position: CGPoint(x: 63.5, y: 950))
        return pause
    }
    
    
}
