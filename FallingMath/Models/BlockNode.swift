//
//  Block.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 19/01/24.
//

import Foundation
import SpriteKit

class BlockNode: GameObject{
    var position: CGPoint
    var node: SKNode
    var number: Float
    
    
    func update() {
        
    }
    
    init(position: CGPoint, number: Float) {
        self.position = position
        self.number = number
        var parentNode: SKSpriteNode
        parentNode = SKSpriteNode(color: .clear, size: CGSize(width: 60, height: 60))
        parentNode.position = CGPoint(x: position.x, y: position.y)
        parentNode.zPosition = -2
        let node = SKShapeNode(rectOf: CGSize(width: 60, height: 60))
        node.fillColor = .clear
        node.strokeColor = UIColor(red: 244/255, green: 110/255, blue: 124/255, alpha: 1)
        node.lineWidth = 4
        node.zPosition = -1
        //        let action = SKAction.fadeOut(withDuration: 0.5)
        //        let action2 = SKAction.fadeIn(withDuration: 0.5)
        //        let sequence = SKAction.sequence([action2, action])
        //        node.run(SKAction.repeatForever(sequence))
        var scoreLabel: SKLabelNode
        scoreLabel = SKLabelNode(fontNamed: "Arial")
        scoreLabel.fontSize = CGFloat(30)
        let randomNumber: Float = number
        scoreLabel.text = String(randomNumber.formatted(.number.precision(.fractionLength(0))))
        scoreLabel.name = String(randomNumber.formatted(.number.precision(.fractionLength(0))))
        scoreLabel.horizontalAlignmentMode = .center
        scoreLabel.verticalAlignmentMode = .center
        scoreLabel.fontColor = UIColor(red: 244/255, green: 110/255, blue: 124/255, alpha: 1)
        
        scoreLabel.position = CGPoint(x: node.frame.midX, y: node.frame.midY)
        
        scoreLabel.zPosition = 0
        
        
        parentNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
        parentNode.physicsBody?.isDynamic = true
        
        parentNode.addChild(node)
        parentNode.addChild(scoreLabel)
        
        
        
        self.node = parentNode
    }
}
