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
        physicsWorld.gravity.dy = -1.62
        backgroundColor = .white
        
        let borda = SKPhysicsBody(edgeLoopFrom: CGRect(x: 25,y: 195,width: self.frame.size.width-50,height: self.frame.size.height))
        borda.friction = 0.2
        self.physicsBody = borda
        
        let background = SKShapeNode(rect: CGRect(x: 25,y: 195,width: self.frame.size.width-50,height: self.frame.size.height-284), cornerRadius: 13)
        background.fillColor = UIColor(red: 253/255, green: 221/255, blue: 224/255, alpha: 1)
        background.zPosition = -999
        background.strokeColor = UIColor(red: 244/255, green: 110/255, blue: 124/255, alpha: 1)
        background.lineWidth = 3
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
                if object.node.contains(touch.location(in: self)){
                    object.node.physicsBody?.isDynamic = false
                    object.node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: 1))
                    let nodeNumber = object.node.children.last?.name
                    if gameData?.number1 == 0{
                        gameData?.number1 = (nodeNumber! as NSString).floatValue
                        let action1 = SKAction.move(to: CGPoint(x:100, y:100), duration: 0.2)
                        let action2 = SKAction.fadeOut(withDuration: 0.1)
                        let action3 = SKAction.removeFromParent()
                        let sequence = SKAction.sequence([action1, action2, action3])
                        object.node.run(sequence)
                    }else{
                        if gameData?.number2 == 0{
                            gameData?.number2 = (nodeNumber! as NSString).floatValue
                            let action1 = SKAction.move(to: CGPoint(x:300, y:100), duration: 0.2)
                            let action2 = SKAction.fadeOut(withDuration: 0.1)
                            let action3 = SKAction.removeFromParent()
                            let sequence = SKAction.sequence([action1, action2, action3])
                            object.node.run(sequence)
                        }
                    }
                    
                    gameData?.objects.remove(at: index)
                }
            }
        }
    }
    
}
