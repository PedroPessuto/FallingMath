//
//  ResumeNode.swift
//  FallingMath
//
//  Created by Raphael Iniesta Reis on 01/02/24.
//

import Foundation
import SpriteKit

class ResumeNode: GameObject {
    var position: CGPoint
    
    var node: SKNode
    
    func update() {
        
    }
    
    init(position: CGPoint) {
        self.position = position
        
        let resumeNode = SKShapeNode(circleOfRadius: 30)
        resumeNode.fillColor = .red
        resumeNode.name = "resume"
        resumeNode.zPosition = 10
        resumeNode.isHidden = true
        resumeNode.position = position

        self.node = resumeNode
    }
    
}
