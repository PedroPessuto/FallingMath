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
    var gameData: GameController?
    var isCreatingBlock = 1
    var calls: Float = 2
    var attempts: Int = 0
    var newValue: [Float:[Float]] = operationGenerator(call: 2)

    override func didMove(to view: SKView) {
        createBackground()
        
        //        gameData?.start()
        
        render()
        gameData?.objective = newValue.keys.first!
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
        background.strokeColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
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
            switch gameData?.operation {
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
            
            
            
            if gameData?.objective == number {
                
                //                newValue = operationGenerator(call: calls)
                //                let firstValue = newValue.keys.first
                //                gameData?.objective = firstValue!
                //                isCreatingBlock = 1
                
                isCreatingBlock = 1
                attempts = 0
                gameData?.maxAttempt = 0
                gameData?.score += 1
                
            }
            // Se não acertar
            else {
               
                attempts = attempts + 1
                
                if gameData?.maxAttempt == attempts {
                    attempts = 0
                    isCreatingBlock = 1
                }
                
                
//                print("Tentativas: \(attempts)")
//                print("Blocks: \(String(describing: gameData?.blockQuantityOnScreen))")
//                print(attempts)
                gameData?.startBlock(number)
                renderLast()
               
            }
        }
        
        if isCreatingBlock == 1 {
//            let values = newValue.values.first
//            for numbers in values!{
//                gameData?.startBlock(numbers)
//                renderLast()
//                
//            }
            gameData?.generateBlocks()
            isCreatingBlock = 0
//            calls += 0.2
        }
       
        // Renderiza Numeros
        if !gameData!.useNumbers.isEmpty {
            for num in gameData!.useNumbers {
                gameData?.startBlock(num)
                renderLast()
            }
            gameData?.useNumbers = []
        }
        
        // Renderiza Ruidos
//        if !gameData!.noiseNumbers.isEmpty {
//            for num in gameData!.noiseNumbers {
//                gameData?.startBlock(num)
//                renderLast()
//            }
//            gameData?.noiseNumbers = []
//        }
        
        if gameData?.returnBlock != 0 {
            gameData?.startBlock(gameData!.returnBlock)
            renderLast()
            gameData?.returnBlock = 0
        }
        
//        count += 1
//        if count >= 800 {
//            gameData?.startBlock()
//            renderLast()
//            count = 0
//        }
        
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
                        if gameData?.number1 == 0 {
                            gameData?.number1 = (nodeNumber! as NSString).floatValue
                            let action1 = SKAction.scale(by: 0.01, duration: 0.4)
                            let action2 = SKAction.fadeOut(withDuration: 0.1)
                            let action3 = SKAction.removeFromParent()
                            let sequence = SKAction.sequence([action1, action2, action3])
                            object.node.run(sequence)
                        }
                        else {
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
