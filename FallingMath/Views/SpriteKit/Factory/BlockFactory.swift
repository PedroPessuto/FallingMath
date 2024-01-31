//
//  BlockFactory.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 19/01/24.
//

import Foundation
var position: [CGFloat] = [0,83,166,252]

class BlockFactory: GOFactory{
    
    func createGameObject() -> GameObject {
        let block: BlockNode = BlockNode(position: CGPoint(x: position.randomElement()! + 63.5, y: 950), number: Float(Int.random(in: 1...99)))
        return block
    }
    
    func createGameObject(number: Float) -> GameObject {
        let block: BlockNode = BlockNode(position: CGPoint(x: position.randomElement()! + 63.5, y: 950), number: number)
        return block
    }
    
    
}
