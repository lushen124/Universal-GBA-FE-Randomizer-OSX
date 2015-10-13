//
//  BaseGame.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/11/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Foundation

protocol BaseGame : class {
    func playableCharacterList() -> [FECharacter]
    func bossCharacterList() -> [FECharacter]
    func eligibleClasses() -> [FEClass]
    
    func standardCharacterList() -> [FECharacter]
    func lordCharacterList() -> [FECharacter]
    func thiefCharacterList() -> [FECharacter]
    
    func standardClassList() -> [FEClass]
    func extendedClassList() -> [FEClass]
    func lordClassList() -> [FEClass]
    func thiefClassList() -> [FEClass]
    
    func characterLinksForCharacter(character: FECharacter) -> [FECharacter]
}