//
//  ResumeFactory.swift
//  FallingMath
//
//  Created by Raphael Iniesta Reis on 01/02/24.
//

import Foundation
import SpriteKit

class ResumeFactory: GOFactory{
    
    func createGameObject() -> GameObject {
        
        let pause: ResumeNode = ResumeNode(position: CGPoint(x: 200, y: 600))
        
        
        return pause
    }
    
    func createGameObject(number: Float) -> GameObject {
        let pause: ResumeNode = ResumeNode(position: CGPoint(x: 63.5, y: 950))
        return pause
    }
    
    
}
