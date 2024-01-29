//
//  GameScene.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 20/01/24.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    var count: Int = 0
    var number: Float = 0
    var result: Int = 0
    var gameData: GameData?
    
    override func didMove(to view: SKView) {
        createBackground()
        
        //        gameData?.start()
        
        render()
    }
    
    func createBackground(){
        physicsWorld.gravity.dy = -1.2
        backgroundColor = SKColor.clear
        
        
        let borda = SKPhysicsBody(edgeLoopFrom: CGRect(x: 21.5,y: 221,width: self.frame.size.width-44,height: self.frame.size.height))
        borda.friction = 0.2
        self.physicsBody = borda
        
        let background = SKShapeNode(rect: CGRect(x: 21.5,y: 221,width: self.frame.size.width-44,height: self.frame.size.height-331), cornerRadius: 13)
        background.fillColor = SKColor(.clear)
        background.zPosition = -999
        background.strokeColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        background.lineWidth = 4
        addChild(background)
    }
    
    func render(){
        if let objects = gameData?.objects {
            for object in objects {
                addChild(object.node)
            }
        }
    }
    
    func renderLast(){
        if let objects = gameData?.objects {
            
            addChild(objects.last!.node)
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if gameData?.number2 != 0{
            switch gameData?.operacao {
            case "+":
                let num1: Float? = gameData?.number1
                let num2: Float? = gameData?.number2
                number = num1! + num2!
                gameData?.number1 = 0
                gameData?.number2 = 0
            case "-":
                let num1: Float? = gameData?.number1
                let num2: Float? = gameData?.number2
                number = num1! - num2!
                gameData?.number1 = 0
                gameData?.number2 = 0
            case "/":
                let num1: Float? = gameData?.number1
                let num2: Float? = gameData?.number2
                number = num1! / num2!
                gameData?.number1 = 0
                gameData?.number2 = 0
            case "x":
                let num1: Float? = gameData?.number1
                let num2: Float? = gameData?.number2
                number = num1! * num2!
                gameData?.number1 = 0
                gameData?.number2 = 0
            default:
                print("erro")
            }
            
            if result == Int(number){
                result = Int.random(in: 1...10)
            }else{
                gameData?.startBlock(number)
                renderLast()
            }
            
        }
        count += 1
        if count >= 100{
            gameData?.startBlock()
            renderLast()
            count = 0
        }
        
        if let objects = gameData?.objects {
            for object in objects {
                
                object.update()
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        if let objects = gameData?.objects {
            for (index,object) in objects.enumerated() {
                if object.node.name == "block"{
                    if object.node.contains(touch.location(in: self)){
                        object.node.physicsBody?.isDynamic = false
                        object.node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: 1))
                        let nodeNumber = object.node.children.last?.name
                        if gameData?.number1 == 0{
                            gameData?.number1 = (nodeNumber! as NSString).floatValue
                            let action1 = SKAction.scale(by: 0.01, duration: 0.4)
                            let action2 = SKAction.fadeOut(withDuration: 0.1)
                            let action3 = SKAction.removeFromParent()
                            let sequence = SKAction.sequence([action1, action2, action3])
                            object.node.run(sequence)
                        }else{
                            if gameData?.number2 == 0{
                                gameData?.number2 = (nodeNumber! as NSString).floatValue
                                let action1 = SKAction.scale(by: 0.01, duration: 0.4)
                                let action2 = SKAction.fadeOut(withDuration: 0.1)
                                let action3 = SKAction.removeFromParent()
                                let sequence = SKAction.sequence([action1, action2, action3])
                                object.node.run(sequence)
                            }
                        }
                        
                        gameData?.objects.remove(at: index)
                    }
                }else{
                    
                }
            }
        }
    }
    
}
