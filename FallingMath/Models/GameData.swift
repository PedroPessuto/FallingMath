//
//  GameData.swift
//  TesteSpriteKit
//
//  Created by Rafael Carreira on 20/01/23.
//

import Foundation


@Observable class GameData {
    var score: Int = 0
    
    var objects: [GameObject] = []
     
    var number1 : Float = 0
    var number2 : Float = 0
    var operacao: String = "+"
    
    func startBlock(){
        createBlock()
    }
    
    func startBlock(_ num: Float){
        createBlockNum(num)
    }
    
    
    func createBlock(){
        create(factory: BlockFactory())
    }
    
    func createBlockNum(_ num: Float){
        createNum(factory: BlockFactory(), num: num)
    }
    
    func createNum(factory: GOFactory, num: Float){
        let object: GameObject = factory.createGameObject(number: num)
        objects.append(object)
    }
    
    func create(factory: GOFactory){
        let object: GameObject = factory.createGameObject()
        objects.append(object)
    }
    
    
    
    
}
