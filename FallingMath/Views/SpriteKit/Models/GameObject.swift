//
//  GameObject.swift
//  TesteSpriteKit
//
//  Created by Pedro Cacique on 20/12/23.
//

import Foundation
import SpriteKit

protocol GameObject {
    var position: CGPoint { get set }
    var node: SKNode { get set }
    
    func update()
}
