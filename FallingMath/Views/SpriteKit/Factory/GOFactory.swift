//
//  GOFactory.swift
//  TesteSpriteKit
//
//  Created by Pedro Cacique on 20/12/23.
//

import Foundation

protocol GOFactory {
    func createGameObject() -> GameObject
    func createGameObject(number: Float) -> GameObject
}
