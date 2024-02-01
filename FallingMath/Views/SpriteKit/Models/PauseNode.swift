//
//  PauseNode.swift
//  FallingMath
//
//  Created by Raphael Iniesta Reis on 01/02/24.
//

import Foundation
import SpriteKit

class PauseNode: GameObject{
    var position: CGPoint
    
    var node: SKNode
    
    func update() {
        
    }
    
    init(position: CGPoint) {
        self.position = position
        
        let pauseNode = SKShapeNode(circleOfRadius: 30)
        pauseNode.fillColor = .yellow
        pauseNode.name = "pause"
        pauseNode.zPosition = 10
        pauseNode.isHidden = false
        pauseNode.position = position
        self.node = pauseNode
    }
    
}
