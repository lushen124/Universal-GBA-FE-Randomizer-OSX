//
//  FECharacterData.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/11/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Foundation

protocol FECharacterData {
    var rawData : NSData {get set}
    
    var characterAffinity : UInt8 {get set}
    var level : UInt8 { get set }
    
    var baseHP : Int8 { get set }
    var baseStr : Int8 { get set }
    var baseSkl : Int8 { get set }
    var baseSpd : Int8 { get set }
    var baseDef : Int8 { get set }
    var baseRes : Int8 { get set }
    var baseLck : Int8 { get set }
    var baseCon : Int8 { get set }
    
    var hpGrowth : UInt8 { get set }
    var strGrowth : UInt8 { get set }
    var sklGrowth : UInt8 { get set }
    var spdGrowth : UInt8 { get set }
    var defGrowth : UInt8 { get set }
    var resGrowth : UInt8 { get set }
    var lckGrowth : UInt8 { get set }
    
    var swordLevel : UInt8 { get set }
    var spearLevel : UInt8 { get set }
    var axeLevel : UInt8 { get set }
    var bowLevel : UInt8 { get set }
    var staffLevel : UInt8 { get set }
    var animaLevel : UInt8 { get set }
    var lightLevel : UInt8 { get set }
    var darkLevel : UInt8 { get set }
    
    var nameIndex : UInt16 { get }
    var bioIndex : UInt16 { get }
    
    var characterId : UInt8 { get set }
    var classId : UInt8 { get set }
    
    var portraitIndex : UInt8 { get }
    
    var paletteIndex : UInt8 { get set }
    var promotedPaletteIndex : UInt8 { get set }
    
    var customUnpromotedSprite : UInt8 { get set }
    var customPromotedSprite : UInt8 { get set }
    
    var ability1 : UInt8 { get set }
    var ability2 : UInt8 { get set }
    var ability3 : UInt8 { get set }
    var ability4 : UInt8 { get set }
    
    var supportDataPointer : UInt32 { get set }
    
}