//
//  WheelNode.swift
//  FallingMath
//
//  Created by Rafael Carreira on 09/02/24.
//

import Foundation
import SpriteKit

class WheelNode: GameObject{
    var position: CGPoint
    
    var node: SKNode
    
    func update() {
   
        
    }
    
    init(position: CGPoint) {
        self.position = position
        let hide = SKAction.fadeOut(withDuration: 0)
        let spacing: CGFloat = 75
        let NodeParent = SKSpriteNode()
        NodeParent.size = CGSize(width: 180, height: 180)
        
        NodeParent.zPosition = 0
        NodeParent.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let center = SKSpriteNode(imageNamed: "Center")
        center.position = CGPoint(x: NodeParent.frame.midX, y: NodeParent.frame.midY)
        center.zPosition = 1
        center.xScale = 1/2
        center.yScale = 1/2
        center.name = "center"
        
        let rightOff = SKSpriteNode(imageNamed: "offRight")
        rightOff.position = CGPoint(x: NodeParent.frame.midX + spacing, y: NodeParent.frame.midY)
        rightOff.zPosition = 1
        rightOff.name = "offRight"
        
        let leftOff = SKSpriteNode(imageNamed: "offLeft")
        leftOff.position = CGPoint(x: NodeParent.frame.midX - spacing, y: NodeParent.frame.midY)
        leftOff.zPosition = 1
        leftOff.name = "offLeft"
        
        let downOff = SKSpriteNode(imageNamed: "offDown")
        downOff.position = CGPoint(x: NodeParent.frame.midX, y: NodeParent.frame.midY - spacing)
        downOff.zPosition = 1
        downOff.name = "offDown"
        
        let upOff = SKSpriteNode(imageNamed: "offUp")
        upOff.position = CGPoint(x: NodeParent.frame.midX, y: NodeParent.frame.midY + spacing)
        upOff.zPosition = 1
        upOff.name = "offUp"
        upOff.run(hide)
        
        let rightOn = SKSpriteNode(imageNamed: "onRight")
        rightOn.position = CGPoint(x: NodeParent.frame.midX + spacing, y: NodeParent.frame.midY)
        rightOn.zPosition = 1
        rightOn.name = "onRight"
        rightOn.run(hide)
        
        let leftOn = SKSpriteNode(imageNamed: "onLeft")
        leftOn.position = CGPoint(x: NodeParent.frame.midX - spacing, y: NodeParent.frame.midY)
        leftOn.zPosition = 1
        leftOn.name = "onLeft"
        leftOn.run(hide)
        
        
        let downOn = SKSpriteNode(imageNamed: "onDown")
        downOn.position = CGPoint(x: NodeParent.frame.midX, y: NodeParent.frame.midY - spacing)
        downOn.zPosition = 1
        downOn.name = "onDown"
        downOn.run(hide)
        
        let upOn = SKSpriteNode(imageNamed: "onUp")
        upOn.position = CGPoint(x: NodeParent.frame.midX, y: NodeParent.frame.midY + spacing)
        upOn.zPosition = 1
        upOn.name = "onUp"
        
        
        
        let plus = SKSpriteNode(imageNamed: "plus")
        plus.position = CGPoint(x: NodeParent.frame.midX, y: NodeParent.frame.midY + spacing)
        plus.zPosition = 2
        plus.name = "plus"
        
        let minus = SKSpriteNode(imageNamed: "minus")
        minus.position = CGPoint(x: NodeParent.frame.midX - spacing, y: NodeParent.frame.midY)
        minus.zPosition = 2
        minus.name = "minus"
        minus.run(hide)
        
        
        let multiplier = SKSpriteNode(imageNamed: "multiplier")
        multiplier.position = CGPoint(x: NodeParent.frame.midX, y: NodeParent.frame.midY - spacing)
        multiplier.zPosition = 2
        multiplier.name = "multiplier"
        multiplier.run(hide)
        
        
        let divide = SKSpriteNode(imageNamed: "divide")
        divide.position = CGPoint(x: NodeParent.frame.midX + spacing, y: NodeParent.frame.midY)
        divide.zPosition = 2
        divide.name = "divide"
        divide.run(hide)
        
        
        
        
        NodeParent.position = position
        NodeParent.addChild(center)
        NodeParent.addChild(rightOff)
        NodeParent.addChild(leftOff)
        NodeParent.addChild(downOff)
        NodeParent.addChild(upOff)
        NodeParent.addChild(rightOn)
        NodeParent.addChild(leftOn)
        NodeParent.addChild(downOn)
        NodeParent.addChild(upOn)
        NodeParent.addChild(divide)
        NodeParent.addChild(plus)
        NodeParent.addChild(multiplier)
        NodeParent.addChild(minus)
        
        NodeParent.name = "wheel"
        
        self.node = NodeParent
    }
}
