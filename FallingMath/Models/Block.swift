//
//  Block.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 16/01/24.
//

import Foundation

@Observable class Block {
    var blockValue: Float
    var blockTimesUsed: Int
   
    init(blockValue: Float, blockTimesUsed: Int = 0) {
        self.blockValue = blockValue
        self.blockTimesUsed = blockTimesUsed
    }
}
