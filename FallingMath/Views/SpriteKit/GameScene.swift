//
//  GameScene.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 20/01/24.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    
    var gameData: GameController?
    
    // Cria o cenario do jogo
    func createBackground(){
        physicsWorld.gravity.dy = -1.2
        backgroundColor = .clear
        
        
        // Chão
        let bottomBorder: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: frame.width, height: 4))
        bottomBorder.position = CGPoint(x: frame.width / 2, y: 240)
        bottomBorder.physicsBody = SKPhysicsBody(rectangleOf: bottomBorder.size)
        bottomBorder.physicsBody?.affectedByGravity = false
        bottomBorder.physicsBody?.isDynamic = false
        addChild(bottomBorder)
        
        // Borda Esquerda
        let leftBorder: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 4, height: frame.height * 2))
        leftBorder.position = CGPoint(x: 28, y: frame.height + 240)
        leftBorder.physicsBody = SKPhysicsBody(rectangleOf: leftBorder.size)
        leftBorder.physicsBody?.affectedByGravity = false
        leftBorder.physicsBody?.isDynamic = false
        addChild(leftBorder)
        
        // Borda Direita
        let rightBorder: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 4, height: frame.height * 2))
        rightBorder.position = CGPoint(x: frame.width - 28, y: frame.height + 240)
        rightBorder.physicsBody = SKPhysicsBody(rectangleOf: leftBorder.size)
        rightBorder.physicsBody?.affectedByGravity = false
        rightBorder.physicsBody?.isDynamic = false
        addChild(rightBorder)
        
        // Câmera para DEBUG
//         let camera = SKCameraNode()
//         camera.setScale(3)
//         addChild(camera)
//         scene!.camera = camera
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
    
    override func didMove(to view: SKView) {
        createBackground()
        gameData?.gameScreenSize = self.frame.size
        gameData?.startGame()
        gameData?.createWheel()
        render()
    }
    
    func lose(){
        if let objects = gameData?.objects {
          for object in objects {
              if object.node.name == "block"{
                  if object.node.physicsBody?.velocity == CGVector(dx: 0, dy: 0){
                      if object.node.position.y >= object.node.frame.height * 5 {
                          gameData?.hasLose = true
                      }
                  }
            }
          }
        }
      }
    
    // Função que é chamada para cada renderização
    override func update(_ currentTime: TimeInterval) {
        
        // Função de Pausar
        if let gameData = gameData {
            self.physicsWorld.speed = gameData.configIsPaused ? 0.0 : 1.0
        }
        
        if !isPaused {
            
            // Renderizar Numeros
            if !gameData!.useNumbers.isEmpty {
                for num in gameData!.useNumbers {
                    gameData?.startBlock(num)
                    renderLast()
                }
                gameData?.useNumbers = []
            }
            
            // Renderiza o returnBlock
            if let returnBlockNumber = gameData?.returnBlock {
                gameData?.startBlock(returnBlockNumber)
                renderLast()
                gameData?.returnBlock = nil
            }
            
            // Atualiza os objetos
            if let objects = gameData?.objects {
                for object in objects {
                    object.update()
                }
            }
            
            lose()
            
        }
        
        
    }
    
    // Verificar ao clicar na tela
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !gameData!.configIsPaused && (gameData?.number1 == nil || gameData?.number2 == nil ) {
           
            let touch = touches.first!
            
            if let objects = gameData?.objects {
                for (index, object) in objects.enumerated() {
                    
                    if let blockNode = object as? BlockNode {

                        if blockNode.node.contains(touch.location(in: self))
                        {
                            
                            if gameData?.number1 != nil && gameData?.number2 == nil {
                                gameData?.number2 = blockNode.number
                            }
                            
                            if gameData?.number1 == nil {
                                gameData?.number1 = blockNode.number
                            }
                            
                            let action1 = SKAction.scale(by: 0.01, duration: 0.4)
                            let action2 = SKAction.fadeOut(withDuration: 0.1)
                            let action3 = SKAction.removeFromParent()
                            let sequence = SKAction.sequence([action1, action2, action3])
                            blockNode.node.run(sequence)
                            gameData?.objects.remove(at: index)
                            
                        }
                    }
                    
                    else if let wheel = object as? WheelNode {
                        
                        if ((wheel.node.childNode(withName: "center")!.contains(touch.location(in: wheel.node.self)))) {
                            
                            if(gameData?.configHaptics == true) {
                                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                            }
                            
                            let AnimDuration = 0.3
                            let rotation = SKAction.rotate(byAngle: (-Double.pi / 2) - 0.3, duration: AnimDuration)
                            let calma = SKAction.rotate(byAngle: 0.35, duration: 0.2)
                            let calma1 = SKAction.rotate(byAngle: -0.05, duration: 0.25)
                            let animationRoullete = SKAction.sequence([rotation,calma, calma1])
                            let rotation1 = SKAction.rotate(toAngle: -Double.pi / 2, duration: 0)
                            // faz a troca do plus
                            
                            if (gameData?.operation == "+"){
                                let hideOn = SKAction.fadeOut(withDuration: AnimDuration)
                              
                                wheel.node.childNode(withName: "onUp")?.run(hideOn)
                                wheel.node.childNode(withName: "plus")?.run(hideOn)
                                
                                let showOff = SKAction.fadeIn(withDuration: AnimDuration)
                                
                                wheel.node.childNode(withName: "offUp")?.run(showOff)
                                
                                wheel.node.childNode(withName: "onLeft")?.run(showOff)
                                wheel.node.childNode(withName: "minus")?.run(rotation1)
                                wheel.node.childNode(withName: "minus")?.run(showOff)
                                wheel.node.childNode(withName: "offLeft")?.run(hideOn)
                                
                                gameData?.operation = "-"
                            }
                            else if (gameData?.operation == "-") {
                                let hideOn = SKAction.fadeOut(withDuration: AnimDuration)
                              
                                wheel.node.childNode(withName: "onLeft")?.run(hideOn)
                                wheel.node.childNode(withName: "minus")?.run(hideOn)
                                
                                let showOff = SKAction.fadeIn(withDuration: AnimDuration)
                                
                                wheel.node.childNode(withName: "offLeft")?.run(showOff)
                                
                                wheel.node.childNode(withName: "onDown")?.run(showOff)
                                wheel.node.childNode(withName: "multiplier")?.run(showOff)
                                wheel.node.childNode(withName: "offDown")?.run(hideOn)
                                gameData?.operation = "x"
                            }
                            else if (gameData?.operation == "x") {
                                let hideOn = SKAction.fadeOut(withDuration: AnimDuration)
                              
                                wheel.node.childNode(withName: "onDown")?.run(hideOn)
                                wheel.node.childNode(withName: "multiplier")?.run(hideOn)
                                
                                let showOff = SKAction.fadeIn(withDuration: AnimDuration)
                                
                                wheel.node.childNode(withName: "offDown")?.run(showOff)
                                
                                wheel.node.childNode(withName: "onRight")?.run(showOff)
                                wheel.node.childNode(withName: "divide")?.run(rotation1)
                                wheel.node.childNode(withName: "divide")?.run(showOff)
                                wheel.node.childNode(withName: "offRight")?.run(hideOn)
                                gameData?.operation = "/"
                            }
                            else if (gameData?.operation == "/"){
                                let hideOn = SKAction.fadeOut(withDuration: AnimDuration)
                              
                                wheel.node.childNode(withName: "onRight")?.run(hideOn)
                                wheel.node.childNode(withName: "divide")?.run(hideOn)
                                
                                let showOff = SKAction.fadeIn(withDuration: AnimDuration)
                                
                                wheel.node.childNode(withName: "offRight")?.run(showOff)
                                
                                wheel.node.childNode(withName: "onUp")?.run(showOff)
                                wheel.node.childNode(withName: "plus")?.run(showOff)
                                wheel.node.childNode(withName: "offUp")?.run(hideOn)
                                gameData?.operation = "+"
                            }
                            let tapAction = SKAction.rotate(byAngle: (Double.pi / 2) + 0.3, duration: AnimDuration)
                            let calmaTap = SKAction.rotate(byAngle: -0.35, duration: 0.2)
                            let calmaTap1 = SKAction.rotate(byAngle: 0.05, duration: 0.25)
                            
                            let animationTap = SKAction.sequence([tapAction,calmaTap, calmaTap1])
                        
                            wheel.node.childNode(withName: "center")?.run(animationTap)
                            wheel.node.run(animationRoullete)
                            print(wheel.node.zRotation)
                        }
                    }
                }
            }
        }
    }
    
}
