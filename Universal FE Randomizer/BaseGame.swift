//
//  BaseGame.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/11/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Foundation

protocol BaseGame : class {
    func gameTitle() -> String
    func cleanCRC32() -> UInt32
    func japaneseCRC32() -> UInt32 // Really only applies to FE6.
    
    func characterTableOffsetAddress() -> UInt32
    func defaultCharacterTableOffset() -> UInt32
    func defaultCharacterCount() -> Int
    func characterObjectSize() -> Int // In bytes
    
    func playableCharacterList() -> [FECharacter]
    func bossCharacterList() -> [FECharacter]
    func isCharacterPlayable(characterObject: FECharacterData) -> Bool
    func isCharacterABoss(characterObject: FECharacterData) -> Bool
    
    func eligibleClasses() -> [FEClass]
    
    func standardCharacterList() -> [FECharacter]
    func lordCharacterList() -> [FECharacter]
    func thiefCharacterList() -> [FECharacter]
    
    func standardClassList() -> [FEClass]
    func extendedClassList() -> [FEClass]
    func lordClassList() -> [FEClass]
    func thiefClassList() -> [FEClass]
    
    func characterLinksForCharacter(character: FECharacter) -> [FECharacter]
    
    func createCharacterObjectFromData(characterData: NSData) -> FECharacterData?
    func dataForCharacterObject(characterData: FECharacterData) -> NSData?
    
}