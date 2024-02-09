//
//  WheelFactory.swift
//  FallingMath
//
//  Created by Rafael Carreira on 09/02/24.
//

import Foundation

class WheelFactory: GOFactory{
    func createGameObject(number: Float, screenSize: CGSize) -> GameObject {
        let wheel: WheelNode = WheelNode(position: CGPoint(x: 200, y: 50))
        return wheel
    }
    
    func createGameObject() -> GameObject {
        let wheel: WheelNode = WheelNode(position: CGPoint(x: 195, y: 70))
        return wheel
    }
    
    func createGameObject(number: Float) -> GameObject {
        let wheel: WheelNode = WheelNode(position: CGPoint(x: 200, y: 50))
        return wheel
    }
    
    
}
