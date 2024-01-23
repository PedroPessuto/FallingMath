//
//  BlockFactory.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 19/01/24.
//

import Foundation

class BlockFactory: GOFactory{
    
    func createGameObject() -> GameObject {
        let operation = operationGenerator()
        
        let block: BlockNode = BlockNode(position: CGPoint(x: CGFloat.random(in: 50...300), y: 950), number: Float.random(in: 1...99))
        return block
    }
    
    func createGameObject(number: Float) -> GameObject {
        let block: BlockNode = BlockNode(position: CGPoint(x: CGFloat.random(in: 50...300), y: 950), number: number)
        return block
    }
    
    
}
