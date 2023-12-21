//
//  GameScenee.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 20/12/23.
//

import Foundation
import SpriteKit

@Observable class GameScene: SKScene {
    
    var gameModel: GameModel?
    let backgroundNode = SKSpriteNode(imageNamed: "back")
    
    override func didMove(to view: SKView) {
        start()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func start(){
        backgroundColor = .black

        backgroundNode.position.x = backgroundNode.size.width/2
        backgroundNode.position.y = backgroundNode.size.height/2
        addChild(backgroundNode)

        addCircle(x: size.width / 2, y: size.height / 2)
        
    }
    
    func addCircle(x: CGFloat, y: CGFloat){
        let node = SKShapeNode(circleOfRadius: 50)
        
        node.fillColor = .red
        node.strokeColor = .yellow
        node.lineWidth = 10
        
        node.position = CGPoint(x: x, y: y)
        
        let action = SKAction.fadeOut(withDuration: 0.5)
        let action2 = SKAction.fadeIn(withDuration: 0.5)
        let action3 = SKAction.scale(by: 2, duration: 0.5)
        let action4 = SKAction.scale(by: 0.5, duration: 0.5)
        let sequence = SKAction.sequence([action2, action3, action4, action])
        node.run(SKAction.repeatForever(sequence))
        
        addChild(node)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view){
            addCircle(x: location.x,
                      y: size.height - location.y)
            gameModel?.score += 1
        }
        
    }
    
}
