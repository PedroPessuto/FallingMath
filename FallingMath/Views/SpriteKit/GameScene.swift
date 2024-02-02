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
        backgroundColor = SKColor.clear
        
        // Chão
        let bottomBorder: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: frame.width, height: 4))
        bottomBorder.position = CGPoint(x: frame.width / 2, y: 0)
        bottomBorder.physicsBody = SKPhysicsBody(rectangleOf: bottomBorder.size)
        bottomBorder.physicsBody?.affectedByGravity = false
        bottomBorder.physicsBody?.isDynamic = false
        addChild(bottomBorder)
        
        // Borda Esquerda
        let leftBorder: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 4, height: frame.height * 2))
        leftBorder.position = CGPoint(x: 0, y: frame.height)
        leftBorder.physicsBody = SKPhysicsBody(rectangleOf: leftBorder.size)
        leftBorder.physicsBody?.affectedByGravity = false
        leftBorder.physicsBody?.isDynamic = false
        addChild(leftBorder)
        
        // Borda Direita
        let rightBorder: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: 4, height: frame.height * 2))
        rightBorder.position = CGPoint(x: frame.width, y: frame.height)
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
    
    func teste() {
        print(self.isPaused)
        print("1")
        self.isPaused = true
        print("2")
        print(self.isPaused)
    }
    
    
    // Init
    override func didMove(to view: SKView) {
        createBackground()
        gameData?.gameScreenSize = self.frame.size
        gameData?.startGame()
        render()
    }
    
    
    // Função que é chamada para cada renderização
    override func update(_ currentTime: TimeInterval) {
    
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
    }
    
    // Verificar ao clicar na tela
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        
        if let objects = gameData?.objects {
            for (index, object) in objects.enumerated() {
                if let blockNode = object as? BlockNode {
                    if blockNode.node.contains(touch.location(in: self)) {
                        
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
            }
        }
    }
    
}
