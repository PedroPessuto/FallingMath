//
//  BlockFactory.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 19/01/24.
//

import Foundation
var position: [CGFloat] = [100]

class BlockFactory: GOFactory{
        
    func createGameObject() -> GameObject {
        let block: BlockNode = BlockNode(position: CGPoint(x: position.randomElement()!, y: 400), number: Float(Int.random(in: 1...99)))
        return block
    }
    
    func createGameObject(number: Float) -> GameObject {
        let block: BlockNode = BlockNode(position: CGPoint(x: position.randomElement()!, y: 400), number: number)
        return block
    }
    
    
    func createGameObject(number: Float, screenSize: CGSize) -> GameObject {
        
        let widthPostions: [CGFloat] = [29, screenSize.width/2,screenSize.width/3, screenSize.width - 30]
        
        let block: BlockNode = BlockNode(position: CGPoint(x: widthPostions.randomElement()!, y: screenSize.height * 1.3), number: number)
        
        return block
    }
    
    
}
