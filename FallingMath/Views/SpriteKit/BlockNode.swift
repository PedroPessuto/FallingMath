//
//  Block.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 19/01/24.
//

import Foundation
import SpriteKit

class BlockNode: GameObject {
    var position: CGPoint
    var node: SKNode
    var number: Float
    var numberText: SKLabelNode = SKLabelNode(fontNamed: "Arial")
    
    func update() {
        let block = node
        let text = numberText
        text.zRotation = -CGFloat(block.zRotation)
    }
    
    init(position: CGPoint, number: Float) {
        self.position = position
        self.number = number
        
        // Cria objeto
        var parentNode: SKSpriteNode
        parentNode = SKSpriteNode(color: .clear, size: CGSize(width: 76, height: 76))
        parentNode.position = CGPoint(x: position.x, y: position.y)
        parentNode.zPosition = -2
        
        // Quadrado
        let node = SKShapeNode(rectOf: CGSize(width: 76, height: 76), cornerRadius: 9)
        node.fillColor = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 0.3)
        node.lineWidth = 5
        node.zPosition = -1
        node.strokeColor = UIColor(red: 1, green:1, blue: 1, alpha: 0.7)
        
        
        // Texto
        let scoreLabel: SKLabelNode = self.numberText
        scoreLabel.fontSize = CGFloat(33)
        let randomNumber: Float = number
        if randomNumber / Float(Int(randomNumber)) == 1{
            scoreLabel.text = String(randomNumber.formatted(.number.precision(.fractionLength(0))))
            scoreLabel.name = String(randomNumber.formatted(.number.precision(.fractionLength(0))))
        }else{
            scoreLabel.text = String(randomNumber.formatted(.number.precision(.fractionLength(1))))
            scoreLabel.name = String(randomNumber.formatted(.number.precision(.fractionLength(1))))
        }
        scoreLabel.horizontalAlignmentMode = .center
        scoreLabel.verticalAlignmentMode = .center
        scoreLabel.fontColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        scoreLabel.position = CGPoint(x: node.frame.midX, y: node.frame.midY)
        scoreLabel.zPosition = 0
        
        // Para Renderizar
        parentNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 83, height: 83))
        parentNode.physicsBody?.isDynamic = true
        parentNode.addChild(node)
        parentNode.addChild(scoreLabel)
        parentNode.name = "block"
        self.node = parentNode
    }
}
