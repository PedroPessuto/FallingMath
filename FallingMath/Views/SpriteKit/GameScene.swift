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
    func createBackgroundx(){
        physicsWorld.gravity.dy = -1.2
        backgroundColor = SKColor.clear
        
        // Chão
        let bottomBorder: SKSpriteNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: frame.width, height: 4))
        bottomBorder.position = CGPoint(x: frame.midX, y: 0)
        bottomBorder.physicsBody = SKPhysicsBody(rectangleOf: bottomBorder.size)
        bottomBorder.physicsBody?.affectedByGravity = false
        bottomBorder.physicsBody?.isDynamic = false
        addChild(bottomBorder)
        
        // Borda Esquerda
        let leftBorder: SKSpriteNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: 4, height: frame.height * 2))
        leftBorder.position = CGPoint(x: 0, y: frame.width)
        leftBorder.physicsBody = SKPhysicsBody(rectangleOf: leftBorder.size)
        leftBorder.physicsBody?.affectedByGravity = false
        leftBorder.physicsBody?.isDynamic = false
        addChild(leftBorder)
        
        // Borda Direita
        let rightBorder: SKSpriteNode = SKSpriteNode(color: UIColor.red, size: CGSize(width: 4, height: frame.height * 2))
        rightBorder.position = CGPoint(x: frame.width, y: frame.height)
        rightBorder.physicsBody = SKPhysicsBody(rectangleOf: leftBorder.size)
        rightBorder.physicsBody?.affectedByGravity = false
        rightBorder.physicsBody?.isDynamic = false
        addChild(rightBorder)
        
        // Border
        let border = SKShapeNode(rectOf: CGSize(width: frame.width - 4, height: 500), cornerRadius: 10)
        border.position = CGPoint(x: frame.midX, y: frame.midY)
        border.strokeColor = .white
        border.lineWidth = 4
        addChild(border)
        
        // Câmera para DEBUG
        //         let camera = SKCameraNode()
        //         camera.setScale(3)
        //         addChild(camera)
        //         scene!.camera = camera
        
    }
    
    func createBackground() {
        
        // Define as cores do gradiente
        var gradientColor1 =  UIColor(red: 138/255, green: 208/255, blue: 228/255, alpha: 1).cgColor
        var gradientColor2 =  UIColor(red: 138/255, green: 208/255, blue: 228/255, alpha: 1).cgColor

        // Crie o CAGradientLayer
        let gradientLayer = CAGradientLayer()
        
        if gameData?.operation == "-" {
            gradientColor1 = UIColor(red: 255/255, green: 51/255, blue: 69/255, alpha: 1).cgColor
            gradientColor2 = UIColor(red: 255/255, green: 137/255, blue: 90/255, alpha: 1).cgColor
        }
        else if gameData?.operation == "x" {
            gradientColor1 = UIColor(red: 40/255, green: 168/255, blue: 165/255, alpha: 1).cgColor
            gradientColor2 = UIColor(red: 74/255, green: 185/255, blue: 168/255, alpha: 1).cgColor
        }
        else if gameData?.operation == "/" {
            gradientColor1 = UIColor(red: 167/255, green: 199/255, blue: 67/255, alpha: 1).cgColor
            gradientColor2 = UIColor(red: 233/255, green: 161/255, blue: 56/255, alpha: 1).cgColor
        }
        gradientLayer.colors = [gradientColor1, gradientColor2]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)

        // Converta o CAGradientLayer em UIImage
        let renderer = UIGraphicsImageRenderer(size: gradientLayer.bounds.size)
        let image = renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }

        // Converta a UIImage em SKTexture
        let texture = SKTexture(image: image)

        // Crie o SKSpriteNode com a SKTexture
        let spriteNode = SKSpriteNode(texture: texture)
        spriteNode.position = CGPoint(x: frame.midX, y: frame.midY)

        addChild(spriteNode)
    }

    func createFooter() {
        
        let bottomBorder: SKSpriteNode = SKSpriteNode(color: UIColor.clear, size: CGSize(width: frame.width, height: 4))
        bottomBorder.position = CGPoint(x: frame.width / 2, y: 0)
        bottomBorder.physicsBody = SKPhysicsBody(rectangleOf: bottomBorder.size)
        bottomBorder.physicsBody?.affectedByGravity = false
        bottomBorder.physicsBody?.isDynamic = false
        addChild(bottomBorder)
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
        createBackgroundx()
        createBackground()
        createFooter()
        gameData?.gameScreenSize = self.frame.size
        gameData?.startGame()
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
            
        }
        
        
    }
    
    // Verificar ao clicar na tela
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !gameData!.configIsPaused && (gameData?.number1 == nil || gameData?.number2 == nil ) {
           
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
    
}
