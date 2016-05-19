//
//  FE6.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/11/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Foundation

enum FE6WeaponRank : UInt8 {
    case NoRank = 0
    case E = 0x01
    case D = 0x33
    case C = 0x65
    case B = 0x97
    case A = 0xC9
    case S = 0xFB
    
}

struct FE6Character : FECharacterData {
    var rawData : NSData
    
    var characterAffinity : UInt8
    var level : UInt8
    
    var baseHP : Int8
    var baseStr : Int8
    var baseSkl : Int8
    var baseSpd : Int8
    var baseDef : Int8
    var baseRes : Int8
    var baseLck : Int8
    var baseCon : Int8
    
    var hpGrowth : UInt8
    var strGrowth : UInt8
    var sklGrowth : UInt8
    var spdGrowth : UInt8
    var defGrowth : UInt8
    var resGrowth : UInt8
    var lckGrowth : UInt8
    
    var swordLevel : UInt8
    var spearLevel : UInt8
    var axeLevel : UInt8
    var bowLevel : UInt8
    var staffLevel : UInt8
    var animaLevel : UInt8
    var lightLevel : UInt8
    var darkLevel : UInt8
    
    var nameIndex : UInt16
    var bioIndex : UInt16
    
    var characterId : UInt8
    var classId : UInt8
    
    var portraitIndex : UInt8
    
    var paletteIndex : UInt8
    var promotedPaletteIndex : UInt8
    
    var customUnpromotedSprite : UInt8
    var customPromotedSprite : UInt8
    
    var ability1 : UInt8
    var ability2 : UInt8
    var ability3 : UInt8
    var ability4 : UInt8
    
    var supportDataPointer : UInt32
}

class FE6: NSObject {

}

extension FE6 : BaseGame {
    
    static let playableCharacterArray : [FECharacter] = [ GenericFECharacter(displayName: "Roy", characterID: 0x01),
        GenericFECharacter(displayName: "Clarine", characterID: 0x02),
        GenericFECharacter(displayName: "Fa", characterID: 0x03),
        GenericFECharacter(displayName: "Shin", characterID: 0x04),
        GenericFECharacter(displayName: "Sue", characterID: 0x05),
        GenericFECharacter(displayName: "Dayan", characterID: 0x06),
        GenericFECharacter(displayName: "Barth", characterID: 0x08),
        GenericFECharacter(displayName: "Bors", characterID: 0x09),
        GenericFECharacter(displayName: "Wendy", characterID: 0x0A),
        GenericFECharacter(displayName: "Douglas", characterID: 0x0B),
        GenericFECharacter(displayName: "Wolt", characterID: 0x0D),
        GenericFECharacter(displayName: "Dorothy", characterID: 0x0E),
        GenericFECharacter(displayName: "Klein", characterID: 0x0F),
        GenericFECharacter(displayName: "Saul", characterID: 0x10),
        GenericFECharacter(displayName: "Ellen", characterID: 0x11),
        GenericFECharacter(displayName: "Yodel", characterID: 0x12),
        GenericFECharacter(displayName: "Chad", characterID: 0x14),
        GenericFECharacter(displayName: "Karel", characterID: 0x15),
        GenericFECharacter(displayName: "Fir", characterID: 0x16),
        GenericFECharacter(displayName: "Rutger", characterID: 0x17),
        GenericFECharacter(displayName: "Dieck", characterID: 0x18),
        GenericFECharacter(displayName: "Oujay", characterID: 0x19),
        GenericFECharacter(displayName: "Garret", characterID: 0x1A),
        GenericFECharacter(displayName: "Alan", characterID: 0x1B),
        GenericFECharacter(displayName: "Lance", characterID: 0x1C),
        GenericFECharacter(displayName: "Percival", characterID: 0x1D),
        GenericFECharacter(displayName: "Igrene", characterID: 0x1E),
        GenericFECharacter(displayName: "Marcus", characterID: 0x1F),
        GenericFECharacter(displayName: "Astore", characterID: 0x20),
        GenericFECharacter(displayName: "Wade", characterID: 0x21),
        GenericFECharacter(displayName: "Lot", characterID: 0x22),
        GenericFECharacter(displayName: "Bartre", characterID: 0x23),
        GenericFECharacter(displayName: "Lugh", characterID: 0x25),
        GenericFECharacter(displayName: "Lilina", characterID: 0x26),
        GenericFECharacter(displayName: "Hugh", characterID: 0x27),
        GenericFECharacter(displayName: "Niime", characterID: 0x28),
        GenericFECharacter(displayName: "Ray", characterID: 0x2A),
        GenericFECharacter(displayName: "Lalum", characterID: 0x2B),
        GenericFECharacter(displayName: "Yuuno", characterID: 0x2C),
        GenericFECharacter(displayName: "Tate", characterID: 0x2E),
        GenericFECharacter(displayName: "Thany", characterID: 0x31),
        GenericFECharacter(displayName: "Zeiss", characterID: 0x32),
        GenericFECharacter(displayName: "Elphin", characterID: 0x34),
        GenericFECharacter(displayName: "Cath", characterID: 0x35),
        GenericFECharacter(displayName: "Sophia", characterID: 0x36),
        GenericFECharacter(displayName: "Miledy", characterID: 0x37),
        GenericFECharacter(displayName: "Gonzales", characterID: 0x38),
        GenericFECharacter(displayName: "Noah", characterID: 0x3A),
        GenericFECharacter(displayName: "Treck", characterID: 0x3B),
        GenericFECharacter(displayName: "Zealot", characterID: 0x3C),
        GenericFECharacter(displayName: "Echidna", characterID: 0x3D),
        GenericFECharacter(displayName: "Cecilia", characterID: 0x3F),
        GenericFECharacter(displayName: "Geese", characterID: 0x40),
        GenericFECharacter(displayName: "Eliwood", characterID: 0x43),
        GenericFECharacter(displayName: "Guinevere", characterID: 0x44),
        GenericFECharacter(displayName: "Hector", characterID: 0xCF)
    ];
    
    static let standardCharacterArray : [FECharacter] = [ GenericFECharacter(displayName: "Clarine", characterID: 0x02),
        GenericFECharacter(displayName: "Fa", characterID: 0x03),
        GenericFECharacter(displayName: "Shin", characterID: 0x04),
        GenericFECharacter(displayName: "Sue", characterID: 0x05),
        GenericFECharacter(displayName: "Dayan", characterID: 0x06),
        GenericFECharacter(displayName: "Barth", characterID: 0x08),
        GenericFECharacter(displayName: "Bors", characterID: 0x09),
        GenericFECharacter(displayName: "Wendy", characterID: 0x0A),
        GenericFECharacter(displayName: "Douglas", characterID: 0x0B),
        GenericFECharacter(displayName: "Wolt", characterID: 0x0D),
        GenericFECharacter(displayName: "Dorothy", characterID: 0x0E),
        GenericFECharacter(displayName: "Klein", characterID: 0x0F),
        GenericFECharacter(displayName: "Saul", characterID: 0x10),
        GenericFECharacter(displayName: "Ellen", characterID: 0x11),
        GenericFECharacter(displayName: "Yodel", characterID: 0x12),
        GenericFECharacter(displayName: "Karel", characterID: 0x15),
        GenericFECharacter(displayName: "Fir", characterID: 0x16),
        GenericFECharacter(displayName: "Rutger", characterID: 0x17),
        GenericFECharacter(displayName: "Dieck", characterID: 0x18),
        GenericFECharacter(displayName: "Oujay", characterID: 0x19),
        GenericFECharacter(displayName: "Garret", characterID: 0x1A),
        GenericFECharacter(displayName: "Alan", characterID: 0x1B),
        GenericFECharacter(displayName: "Lance", characterID: 0x1C),
        GenericFECharacter(displayName: "Percival", characterID: 0x1D),
        GenericFECharacter(displayName: "Igrene", characterID: 0x1E),
        GenericFECharacter(displayName: "Marcus", characterID: 0x1F),
        GenericFECharacter(displayName: "Wade", characterID: 0x21),
        GenericFECharacter(displayName: "Lot", characterID: 0x22),
        GenericFECharacter(displayName: "Bartre", characterID: 0x23),
        GenericFECharacter(displayName: "Lugh", characterID: 0x25),
        GenericFECharacter(displayName: "Lilina", characterID: 0x26),
        GenericFECharacter(displayName: "Hugh", characterID: 0x27),
        GenericFECharacter(displayName: "Niime", characterID: 0x28),
        GenericFECharacter(displayName: "Ray", characterID: 0x2A),
        GenericFECharacter(displayName: "Lalum", characterID: 0x2B),
        GenericFECharacter(displayName: "Yuuno", characterID: 0x2C),
        GenericFECharacter(displayName: "Tate", characterID: 0x2E),
        GenericFECharacter(displayName: "Thany", characterID: 0x31),
        GenericFECharacter(displayName: "Zeiss", characterID: 0x32),
        GenericFECharacter(displayName: "Elphin", characterID: 0x34),
        GenericFECharacter(displayName: "Sophia", characterID: 0x36),
        GenericFECharacter(displayName: "Miledy", characterID: 0x37),
        GenericFECharacter(displayName: "Gonzales", characterID: 0x38),
        GenericFECharacter(displayName: "Noah", characterID: 0x3A),
        GenericFECharacter(displayName: "Treck", characterID: 0x3B),
        GenericFECharacter(displayName: "Zealot", characterID: 0x3C),
        GenericFECharacter(displayName: "Echidna", characterID: 0x3D),
        GenericFECharacter(displayName: "Cecilia", characterID: 0x3F),
        GenericFECharacter(displayName: "Geese", characterID: 0x40),
        GenericFECharacter(displayName: "Eliwood", characterID: 0x43),
        GenericFECharacter(displayName: "Guinevere", characterID: 0x44),
        GenericFECharacter(displayName: "Hector", characterID: 0xCF)
    ];
    
    static let lordCharacterArray : [FECharacter] = [ GenericFECharacter(displayName: "Roy", characterID: 0x01) ];
    
    static let thiefCharacterArray : [FECharacter] = [ GenericFECharacter(displayName: "Chad", characterID: 0x14),
        GenericFECharacter(displayName: "Astore", characterID: 0x20),
        GenericFECharacter(displayName: "Cath", characterID: 0x35),
    ];
    
    static let bossCharacterArray : [FECharacter] = [ GenericFECharacter(displayName: "Damas", characterID: 0x4A),
        GenericFECharacter(displayName: "Rude", characterID: 0x4B),
        GenericFECharacter(displayName: "Slater", characterID: 0x4C),
        GenericFECharacter(displayName: "Erik", characterID: 0x4D),
        GenericFECharacter(displayName: "Dory", characterID: 0x4E),
        GenericFECharacter(displayName: "Wagner", characterID: 0x4F),
        GenericFECharacter(displayName: "Devias", characterID: 0x50),
        GenericFECharacter(displayName: "Reigans", characterID: 0x51),
        GenericFECharacter(displayName: "Scott", characterID: 0x52),
        GenericFECharacter(displayName: "Nord", characterID: 0x53),
        GenericFECharacter(displayName: "Flaer", characterID: 0x55),
        GenericFECharacter(displayName: "Oro", characterID: 0x56),
        GenericFECharacter(displayName: "Aine", characterID: 0x58),
        GenericFECharacter(displayName: "Narshen", characterID: 0x59),
        GenericFECharacter(displayName: "Randy", characterID: 0x5A),
        GenericFECharacter(displayName: "Maggie", characterID: 0x5B),
        GenericFECharacter(displayName: "Rose", characterID: 0x5C),
        GenericFECharacter(displayName: "Raeth", characterID: 0x5D),
        GenericFECharacter(displayName: "Arcard", characterID: 0x5E),
        GenericFECharacter(displayName: "Martel", characterID: 0x5F),
        GenericFECharacter(displayName: "Sigune", characterID: 0x60),
        GenericFECharacter(displayName: "Roartz", characterID: 0x61),
        GenericFECharacter(displayName: "Murdock", characterID: 0x62),
        GenericFECharacter(displayName: "Brunya", characterID: 0x63),
        //            GenericFECharacter(displayName: "Zephiel", characterID: 0x64),
        //            GenericFECharacter(displayName: "Idoun (Shaman)", characterID: 0x65),
        //            GenericFECharacter(displayName: "Idoun (Dragon)", characterID: 0x66),
        //            GenericFECharacter(displayName: "Yahn", characterID: 0x67),
        GenericFECharacter(displayName: "Zeke", characterID: 0x68),
        GenericFECharacter(displayName: "Monke", characterID: 0x69),
        GenericFECharacter(displayName: "Kel", characterID: 0x6A),
        GenericFECharacter(displayName: "Henning", characterID: 0xB5),
        GenericFECharacter(displayName: "Scouran", characterID: 0xB6),
        GenericFECharacter(displayName: "Grero", characterID: 0xB8),
        GenericFECharacter(displayName: "Ohtz", characterID: 0xB9),
        GenericFECharacter(displayName: "Teck", characterID: 0xBA),
        GenericFECharacter(displayName: "Thoril", characterID: 0xBE),
        GenericFECharacter(displayName: "Brakul", characterID: 0xBF),
        GenericFECharacter(displayName: "Kudoka", characterID: 0xC0),
        GenericFECharacter(displayName: "Maral", characterID: 0xC1),
        GenericFECharacter(displayName: "Kabul", characterID: 0xC2),
        GenericFECharacter(displayName: "Chan", characterID: 0xC3),
        GenericFECharacter(displayName: "Pereth", characterID: 0xC4),
        GenericFECharacter(displayName: "Windam", characterID: 0xC6),
        GenericFECharacter(displayName: "Morgan", characterID: 0xC8)];
    
    static let validClasses : [FEClass] = [ GenericFEClass(displayName: "Lord", classID: 0x01),
        GenericFEClass(displayName: "Master Lord", classID: 0x43),
        GenericFEClass(displayName: "Mercenary", classID: 0x02),
        GenericFEClass(displayName: "Hero", classID: 0x04),
        GenericFEClass(displayName: "Hero (F)", classID: 0x05),
        GenericFEClass(displayName: "Myrmidon", classID: 0x06),
        GenericFEClass(displayName: "Myrmidon (F)", classID: 0x07),
        GenericFEClass(displayName: "Swordmaster", classID: 0x08),
        GenericFEClass(displayName: "Swordmaster (F)", classID: 0x09),
        GenericFEClass(displayName: "Fighter", classID: 0x0A),
        GenericFEClass(displayName: "Warrior", classID: 0x0B),
        GenericFEClass(displayName: "Armor Knight", classID: 0x0C),
        GenericFEClass(displayName: "Armor Knight (F)", classID: 0x0D),
        GenericFEClass(displayName: "General", classID: 0x0E),
        GenericFEClass(displayName: "General (F)", classID: 0x0F),
        GenericFEClass(displayName: "Archer", classID: 0x10),
        GenericFEClass(displayName: "Archer (F)", classID: 0x11),
        GenericFEClass(displayName: "Sniper", classID: 0x12),
        GenericFEClass(displayName: "Sniper (F)", classID: 0x13),
        GenericFEClass(displayName: "Priest", classID: 0x14),
        GenericFEClass(displayName: "Cleric", classID: 0x15),
        GenericFEClass(displayName: "Bishop", classID: 0x16),
        GenericFEClass(displayName: "Bishop (F)", classID: 0x17),
        GenericFEClass(displayName: "Mage", classID: 0x18),
        GenericFEClass(displayName: "Mage (F)", classID: 0x19),
        GenericFEClass(displayName: "Sage", classID: 0x1A),
        GenericFEClass(displayName: "Sage (F)", classID: 0x1B),
        GenericFEClass(displayName: "Shaman", classID: 0x1C),
        GenericFEClass(displayName: "Shaman (F)", classID: 0x1D),
        GenericFEClass(displayName: "Druid", classID: 0x1E),
        GenericFEClass(displayName: "Druid (F)", classID: 0x1F),
        GenericFEClass(displayName: "Cavalier", classID: 0x20),
        GenericFEClass(displayName: "Paladin", classID: 0x22),
        GenericFEClass(displayName: "Troubadour", classID: 0x24),
        GenericFEClass(displayName: "Valkyrie", classID: 0x25),
        GenericFEClass(displayName: "Nomad", classID: 0x26),
        GenericFEClass(displayName: "Nomad (F)", classID: 0x27),
        GenericFEClass(displayName: "Nomad Trooper", classID: 0x28),
        GenericFEClass(displayName: "Nomad Trooper (F)", classID: 0x29),
        GenericFEClass(displayName: "Pegasus Knight", classID: 0x2A),
        GenericFEClass(displayName: "Falcoknight", classID: 0x2B),
        GenericFEClass(displayName: "Wyvern Rider", classID: 0x2C),
        GenericFEClass(displayName: "Wyvern Rider (F)", classID: 0x2D),
        GenericFEClass(displayName: "Wyvern Lord", classID: 0x2E),
        GenericFEClass(displayName: "Wyvern Lord (F)", classID: 0x2F),
        GenericFEClass(displayName: "Soldier", classID: 0x30),
        GenericFEClass(displayName: "Bandit", classID: 0x31),
        GenericFEClass(displayName: "Pirate", classID: 0x32),
        GenericFEClass(displayName: "Berserker", classID: 0x33),
        GenericFEClass(displayName: "Thief", classID: 0x34),
        GenericFEClass(displayName: "Thief (F)", classID: 0x35),
        GenericFEClass(displayName: "Bard", classID: 0x36),
        GenericFEClass(displayName: "Dancer", classID: 0x37),
        GenericFEClass(displayName: "Manakete", classID: 0x38),
        GenericFEClass(displayName: "Manakete (F)", classID: 0x39)
        //            GenericFEClass(displayName: "King", classID: 0x3D),
    ];
    
    static let standardClassArray : [FEClass] = [ GenericFEClass(displayName: "Mercenary", classID: 0x02),
        GenericFEClass(displayName: "Hero", classID: 0x04),
        GenericFEClass(displayName: "Hero (F)", classID: 0x05),
        GenericFEClass(displayName: "Myrmidon", classID: 0x06),
        GenericFEClass(displayName: "Myrmidon (F)", classID: 0x07),
        GenericFEClass(displayName: "Swordmaster", classID: 0x08),
        GenericFEClass(displayName: "Swordmaster (F)", classID: 0x09),
        GenericFEClass(displayName: "Fighter", classID: 0x0A),
        GenericFEClass(displayName: "Warrior", classID: 0x0B),
        GenericFEClass(displayName: "Armor Knight", classID: 0x0C),
        GenericFEClass(displayName: "Armor Knight (F)", classID: 0x0D),
        GenericFEClass(displayName: "General", classID: 0x0E),
        GenericFEClass(displayName: "General (F)", classID: 0x0F),
        GenericFEClass(displayName: "Archer", classID: 0x10),
        GenericFEClass(displayName: "Archer (F)", classID: 0x11),
        GenericFEClass(displayName: "Sniper", classID: 0x12),
        GenericFEClass(displayName: "Sniper (F)", classID: 0x13),
        GenericFEClass(displayName: "Priest", classID: 0x14),
        GenericFEClass(displayName: "Cleric", classID: 0x15),
        GenericFEClass(displayName: "Bishop", classID: 0x16),
        GenericFEClass(displayName: "Bishop (F)", classID: 0x17),
        GenericFEClass(displayName: "Mage", classID: 0x18),
        GenericFEClass(displayName: "Mage (F)", classID: 0x19),
        GenericFEClass(displayName: "Sage", classID: 0x1A),
        GenericFEClass(displayName: "Sage (F)", classID: 0x1B),
        GenericFEClass(displayName: "Shaman", classID: 0x1C),
        GenericFEClass(displayName: "Shaman (F)", classID: 0x1D),
        GenericFEClass(displayName: "Druid", classID: 0x1E),
        GenericFEClass(displayName: "Druid (F)", classID: 0x1F),
        GenericFEClass(displayName: "Cavalier", classID: 0x20),
        GenericFEClass(displayName: "Paladin", classID: 0x22),
        GenericFEClass(displayName: "Troubadour", classID: 0x24),
        GenericFEClass(displayName: "Valkyrie", classID: 0x25),
        GenericFEClass(displayName: "Nomad", classID: 0x26),
        GenericFEClass(displayName: "Nomad (F)", classID: 0x27),
        GenericFEClass(displayName: "Nomad Trooper", classID: 0x28),
        GenericFEClass(displayName: "Nomad Trooper (F)", classID: 0x29),
        GenericFEClass(displayName: "Pegasus Knight", classID: 0x2A),
        GenericFEClass(displayName: "Falcoknight", classID: 0x2B),
        GenericFEClass(displayName: "Wyvern Rider", classID: 0x2C),
        GenericFEClass(displayName: "Wyvern Rider (F)", classID: 0x2D),
        GenericFEClass(displayName: "Wyvern Lord", classID: 0x2E),
        GenericFEClass(displayName: "Wyvern Lord (F)", classID: 0x2F),
        GenericFEClass(displayName: "Pirate", classID: 0x32),
        GenericFEClass(displayName: "Berserker", classID: 0x33)
    ];
    
    static let extendedClassArray : [FEClass] = [
        GenericFEClass(displayName: "Soldier", classID: 0x30),
        GenericFEClass(displayName: "Bandit", classID: 0x31),
        GenericFEClass(displayName: "Bard", classID: 0x36),
        GenericFEClass(displayName: "Dancer", classID: 0x37),
        GenericFEClass(displayName: "Manakete", classID: 0x38),
        GenericFEClass(displayName: "Manakete (F)", classID: 0x39)
    ];
    
    static let lordClassArray : [FEClass] = [ GenericFEClass(displayName: "Lord", classID: 0x01)];
    
    static let thiefClassArray : [FEClass] = [ GenericFEClass(displayName: "Thief", classID: 0x34),
        GenericFEClass(displayName: "Thief (F)", classID: 0x35)
    ];
    
    func gameTitle() -> String {
        return "Fire Emblem 6: Binding Blade"
    }
    
    func cleanCRC32() -> UInt32 {
        return 0x99b8b6d7;
    }
    
    func japaneseCRC32() -> UInt32 {
        return 0xd38763e1;
    }
    
    func characterTableOffsetAddress() -> UInt32 {
        return 0x17680;
    }
    
    func defaultCharacterTableOffset() -> UInt32 {
        return 0x6076A0;
    }
    
    func defaultCharacterCount() -> Int {
        return 220;
    }
    
    func characterObjectSize() -> Int {
        return 48;
    }
    
    func playableCharacterList() -> [FECharacter] {
        return FE6.playableCharacterArray;
    }
    
    func bossCharacterList() -> [FECharacter] {
        return FE6.bossCharacterArray;
    }
    
    func isCharacterPlayable(characterObject: FECharacterData) -> Bool {
        for character in playableCharacterList() {
            if (character.characterID == characterObject.characterId) {
                return true;
            }
        }
        
        return false;
    }
    
    func isCharacterABoss(characterObject: FECharacterData) -> Bool {
        for character in bossCharacterList() {
            if (character.characterID == characterObject.characterId) {
                return true;
            }
        }
        
        return false;
    }
    
    func eligibleClasses() -> [FEClass] {
        return FE6.validClasses;
    }
    
    func standardCharacterList() -> [FECharacter] {
        return FE6.standardCharacterArray;
    }
    
    func lordCharacterList() -> [FECharacter] {
        return FE6.lordCharacterArray;
    }
    
    func thiefCharacterList() -> [FECharacter] {
        return FE6.thiefCharacterArray;
    }
    
    func standardClassList() -> [FEClass] {
        return FE6.standardClassArray;
    }
    
    func extendedClassList() -> [FEClass] {
        return FE6.extendedClassArray;
    }
    
    func lordClassList() -> [FEClass] {
        return FE6.lordClassArray;
    }
    
    func thiefClassList() -> [FEClass] {
        return FE6.thiefClassArray;
    }
    
    func characterLinksForCharacter(character: FECharacter) -> [FECharacter] {
        // There are no links.
        return []
    }
    
    // Factory Methods
    
    func createCharacterObjectFromData(characterData: NSData) -> FECharacterData? {
        if (characterData.length == characterObjectSize()) {
            var namePointer : UInt16 = 0;
            var currentByte : UInt8 = 0;
            characterData.getBytes(&currentByte, range: NSRange.init(location: 0, length: 1));
            namePointer = UInt16(currentByte);
            characterData.getBytes(&currentByte, range: NSRange.init(location: 1, length: 1));
            namePointer = namePointer | UInt16(currentByte) << 8;
            
            var descriptionPointer : UInt16 = 0;
            characterData.getBytes(&currentByte, range: NSRange.init(location: 0, length: 1));
            descriptionPointer = UInt16(currentByte);
            characterData.getBytes(&currentByte, range: NSRange.init(location: 1, length: 1));
            descriptionPointer = descriptionPointer | UInt16(currentByte) << 8;
            
            var characterNumber : UInt8 = 0;
            characterData.getBytes(&characterNumber, range: NSRange.init(location: 4, length: 1));
            var classID : UInt8 = 0;
            characterData.getBytes(&classID, range: NSRange.init(location: 5, length: 1));
            var portraitID : UInt8 = 0;
            characterData.getBytes(&portraitID, range: NSRange.init(location: 6, length: 1));
            // Byte 7 is unknown.
            // Byte 8 is Mini Portrait (unused)
            var affinity : UInt8 = 0;
            characterData.getBytes(&affinity, range: NSRange.init(location: 9, length: 1));
            // Byte 10 is Unknown.
            var level : UInt8 = 0;
            characterData.getBytes(&level, range: NSRange.init(location: 11, length: 1));
            
            var baseHP : Int8 = 0;
            characterData.getBytes(&baseHP, range: NSRange.init(location: 12, length: 1));
            var baseSTR : Int8 = 0;
            characterData.getBytes(&baseSTR, range: NSRange.init(location: 13, length: 1));
            var baseSKL : Int8 = 0;
            characterData.getBytes(&baseSKL, range: NSRange.init(location: 14, length: 1));
            var baseSPD : Int8 = 0;
            characterData.getBytes(&baseSPD, range: NSRange.init(location: 15, length: 1));
            var baseDEF : Int8 = 0;
            characterData.getBytes(&baseDEF, range: NSRange.init(location: 16, length: 1));
            var baseRES : Int8 = 0;
            characterData.getBytes(&baseRES, range: NSRange.init(location: 17, length: 1));
            var baseLCK : Int8 = 0;
            characterData.getBytes(&baseLCK, range: NSRange.init(location: 18, length: 1));
            
            var bonusCON : Int8 = 0;
            characterData.getBytes(&bonusCON, range: NSRange.init(location: 19, length: 1));
            
            var swordLevel : UInt8 = 0;
            characterData.getBytes(&swordLevel, range: NSRange.init(location: 20, length: 1));
            var lanceLevel : UInt8 = 0;
            characterData.getBytes(&lanceLevel, range: NSRange.init(location: 21, length: 1));
            var axeLevel : UInt8 = 0;
            characterData.getBytes(&axeLevel, range: NSRange.init(location: 22, length: 1));
            var bowLevel : UInt8 = 0;
            characterData.getBytes(&bowLevel, range: NSRange.init(location: 23, length: 1));
            var staffLevel : UInt8 = 0;
            characterData.getBytes(&staffLevel, range: NSRange.init(location: 24, length: 1));
            var animaLevel : UInt8 = 0;
            characterData.getBytes(&animaLevel, range: NSRange.init(location: 25, length: 1));
            var lightLevel : UInt8 = 0;
            characterData.getBytes(&lightLevel, range: NSRange.init(location: 26, length: 1));
            var darkLevel : UInt8 = 0;
            characterData.getBytes(&darkLevel, range: NSRange.init(location: 27, length: 1));
            
            var hpGrowth : UInt8 = 0;
            characterData.getBytes(&hpGrowth, range: NSRange.init(location: 28, length: 1));
            var strGrowth : UInt8 = 0;
            characterData.getBytes(&strGrowth, range: NSRange.init(location: 29, length: 1));
            var sklGrowth : UInt8 = 0;
            characterData.getBytes(&sklGrowth, range: NSRange.init(location: 30, length: 1));
            var spdGrowth : UInt8 = 0;
            characterData.getBytes(&spdGrowth, range: NSRange.init(location: 31, length: 1));
            var defGrowth : UInt8 = 0;
            characterData.getBytes(&defGrowth, range: NSRange.init(location: 32, length: 1));
            var resGrowth : UInt8 = 0;
            characterData.getBytes(&resGrowth, range: NSRange.init(location: 33, length: 1));
            var lckGrowth : UInt8 = 0;
            characterData.getBytes(&lckGrowth, range: NSRange.init(location: 34, length: 1));

            var unpromotedPalette : UInt8 = 0;
            characterData.getBytes(&unpromotedPalette, range: NSRange.init(location: 35, length: 1));
            var promotedPalette : UInt8 = 0;
            characterData.getBytes(&promotedPalette, range: NSRange.init(location: 36, length: 1));
            
            // Byte 37 is Unknown.
            // Byte 38 is Unknown.
            // Byte 39 is Unknown.
            
            var ability1 : UInt8 = 0;
            characterData.getBytes(&ability1, range: NSRange.init(location: 40, length: 1));
            var ability2 : UInt8 = 0;
            characterData.getBytes(&ability2, range: NSRange.init(location: 41, length: 1));
            var ability3 : UInt8 = 0;
            characterData.getBytes(&ability3, range: NSRange.init(location: 42, length: 1));
            var ability4 : UInt8 = 0;
            characterData.getBytes(&ability4, range: NSRange.init(location: 43, length: 1));
            
            var supportsDataPointer : UInt32 = 0;
            characterData.getBytes(&currentByte, range: NSRange.init(location: 44, length: 1));
            supportsDataPointer = supportsDataPointer | UInt32(currentByte);
            characterData.getBytes(&currentByte, range: NSRange.init(location: 45, length: 1));
            supportsDataPointer = supportsDataPointer | (UInt32(currentByte) << 8);
            characterData.getBytes(&currentByte, range: NSRange.init(location: 46, length: 1));
            supportsDataPointer = supportsDataPointer | (UInt32(currentByte) << 16);
            characterData.getBytes(&currentByte, range: NSRange.init(location: 47, length: 1));
            supportsDataPointer = supportsDataPointer | (UInt32(currentByte) << 24);
            
            let characterObject : FE6Character = FE6Character.init(rawData: characterData, characterAffinity: affinity, level: level, baseHP: baseHP, baseStr: baseSTR, baseSkl: baseSKL, baseSpd: baseSPD, baseDef: baseDEF, baseRes: baseRES, baseLck: baseLCK, baseCon: bonusCON, hpGrowth: hpGrowth, strGrowth: strGrowth, sklGrowth: sklGrowth, spdGrowth: spdGrowth, defGrowth: defGrowth, resGrowth: resGrowth, lckGrowth: lckGrowth, swordLevel: swordLevel, spearLevel: lanceLevel, axeLevel: axeLevel, bowLevel: bowLevel, staffLevel: staffLevel, animaLevel: animaLevel, lightLevel: lightLevel, darkLevel: darkLevel, nameIndex: namePointer, bioIndex: descriptionPointer, characterId: characterNumber, classId: classID, portraitIndex: portraitID, paletteIndex: unpromotedPalette, promotedPaletteIndex: promotedPalette, customUnpromotedSprite: 0, customPromotedSprite: 0, ability1: ability1, ability2: ability2, ability3: ability3, ability4: ability4, supportDataPointer: supportsDataPointer);
            
            return characterObject;
        }
        else {
            return nil;
        }
    }
    
    // Serialization Methods
    func dataForCharacterObject(characterData: FECharacterData) -> NSData? {
        let dataOutput : NSMutableData = NSMutableData.init(data: characterData.rawData);
        
        var currentByte : UInt8 = UInt8(characterData.nameIndex & 0xFF);
        dataOutput.replaceBytesInRange(NSRange.init(location: 0, length: 1), withBytes: &currentByte);
        currentByte = UInt8((characterData.nameIndex & 0xFF00) >> 8);
        dataOutput.replaceBytesInRange(NSRange.init(location: 1, length: 1), withBytes: &currentByte);
        
        currentByte = UInt8(characterData.bioIndex & 0xFF);
        dataOutput.replaceBytesInRange(NSRange.init(location: 2, length: 1), withBytes: &currentByte);
        currentByte = UInt8((characterData.bioIndex & 0xFF00) >> 8);
        dataOutput.replaceBytesInRange(NSRange.init(location: 3, length: 1), withBytes: &currentByte);
        
        currentByte = characterData.characterId;
        dataOutput.replaceBytesInRange(NSRange.init(location: 4, length: 1), withBytes: &currentByte);
        currentByte = characterData.classId;
        dataOutput.replaceBytesInRange(NSRange.init(location: 5, length: 1), withBytes: &currentByte);
        currentByte = characterData.portraitIndex;
        dataOutput.replaceBytesInRange(NSRange.init(location: 6, length: 1), withBytes: &currentByte);
        
        // Byte 7 is unknown.
        // Byte 8 is Mini portrait (unused)
        
        currentByte = characterData.characterAffinity;
        dataOutput.replaceBytesInRange(NSRange.init(location: 9, length: 1), withBytes: &currentByte);
        
        // Byte 10 is unknown.
        
        currentByte = characterData.level;
        dataOutput.replaceBytesInRange(NSRange.init(location: 11, length: 1), withBytes: &currentByte);
        
        var signedByte : Int8 = characterData.baseHP;
        dataOutput.replaceBytesInRange(NSRange.init(location: 12, length: 1), withBytes: &signedByte);
        signedByte = characterData.baseStr;
        dataOutput.replaceBytesInRange(NSRange.init(location: 13, length: 1), withBytes: &signedByte);
        signedByte = characterData.baseSkl;
        dataOutput.replaceBytesInRange(NSRange.init(location: 14, length: 1), withBytes: &signedByte);
        signedByte = characterData.baseSpd;
        dataOutput.replaceBytesInRange(NSRange.init(location: 15, length: 1), withBytes: &signedByte);
        signedByte = characterData.baseDef;
        dataOutput.replaceBytesInRange(NSRange.init(location: 16, length: 1), withBytes: &signedByte);
        signedByte = characterData.baseRes;
        dataOutput.replaceBytesInRange(NSRange.init(location: 17, length: 1), withBytes: &signedByte);
        signedByte = characterData.baseLck;
        dataOutput.replaceBytesInRange(NSRange.init(location: 18, length: 1), withBytes: &signedByte);

        signedByte = characterData.baseCon;
        dataOutput.replaceBytesInRange(NSRange.init(location: 19, length: 1), withBytes: &signedByte);
        
        currentByte = characterData.swordLevel;
        dataOutput.replaceBytesInRange(NSRange.init(location: 20, length: 1), withBytes: &currentByte);
        currentByte = characterData.spearLevel;
        dataOutput.replaceBytesInRange(NSRange.init(location: 21, length: 1), withBytes: &currentByte);
        currentByte = characterData.axeLevel;
        dataOutput.replaceBytesInRange(NSRange.init(location: 22, length: 1), withBytes: &currentByte);
        currentByte = characterData.bowLevel;
        dataOutput.replaceBytesInRange(NSRange.init(location: 23, length: 1), withBytes: &currentByte);
        currentByte = characterData.staffLevel;
        dataOutput.replaceBytesInRange(NSRange.init(location: 24, length: 1), withBytes: &currentByte);
        currentByte = characterData.animaLevel;
        dataOutput.replaceBytesInRange(NSRange.init(location: 25, length: 1), withBytes: &currentByte);
        currentByte = characterData.lightLevel;
        dataOutput.replaceBytesInRange(NSRange.init(location: 26, length: 1), withBytes: &currentByte);
        currentByte = characterData.darkLevel;
        dataOutput.replaceBytesInRange(NSRange.init(location: 27, length: 1), withBytes: &currentByte);
        
        currentByte = characterData.hpGrowth;
        dataOutput.replaceBytesInRange(NSRange.init(location: 28, length: 1), withBytes: &currentByte);
        currentByte = characterData.strGrowth;
        dataOutput.replaceBytesInRange(NSRange.init(location: 29, length: 1), withBytes: &currentByte);
        currentByte = characterData.sklGrowth;
        dataOutput.replaceBytesInRange(NSRange.init(location: 30, length: 1), withBytes: &currentByte);
        currentByte = characterData.spdGrowth;
        dataOutput.replaceBytesInRange(NSRange.init(location: 31, length: 1), withBytes: &currentByte);
        currentByte = characterData.defGrowth;
        dataOutput.replaceBytesInRange(NSRange.init(location: 32, length: 1), withBytes: &currentByte);
        currentByte = characterData.resGrowth;
        dataOutput.replaceBytesInRange(NSRange.init(location: 33, length: 1), withBytes: &currentByte);
        currentByte = characterData.lckGrowth;
        dataOutput.replaceBytesInRange(NSRange.init(location: 34, length: 1), withBytes: &currentByte);
        
        currentByte = characterData.paletteIndex;
        dataOutput.replaceBytesInRange(NSRange.init(location: 35, length: 1), withBytes: &currentByte);
        currentByte = characterData.promotedPaletteIndex;
        dataOutput.replaceBytesInRange(NSRange.init(location: 36, length: 1), withBytes: &currentByte);
        
        // Byte 37 is unknown.
        // Byte 38 is unknown.
        // Byte 39 is unknown.
        
        currentByte = characterData.ability1;
        dataOutput.replaceBytesInRange(NSRange.init(location: 40, length: 1), withBytes: &currentByte);
        currentByte = characterData.ability2;
        dataOutput.replaceBytesInRange(NSRange.init(location: 41, length: 1), withBytes: &currentByte);
        currentByte = characterData.ability3;
        dataOutput.replaceBytesInRange(NSRange.init(location: 42, length: 1), withBytes: &currentByte);
        currentByte = characterData.ability4;
        dataOutput.replaceBytesInRange(NSRange.init(location: 43, length: 1), withBytes: &currentByte);
        
        currentByte = UInt8(characterData.supportDataPointer & 0xFF);
        dataOutput.replaceBytesInRange(NSRange.init(location: 44, length: 1), withBytes: &currentByte);
        currentByte = UInt8((characterData.supportDataPointer & 0xFF00) >> 8);
        dataOutput.replaceBytesInRange(NSRange.init(location: 45, length: 1), withBytes: &currentByte);
        currentByte = UInt8((characterData.supportDataPointer & 0xFF0000) >> 16);
        dataOutput.replaceBytesInRange(NSRange.init(location: 46, length: 1), withBytes: &currentByte);
        currentByte = UInt8((characterData.supportDataPointer & 0xFF000000) >> 24);
        dataOutput.replaceBytesInRange(NSRange.init(location: 47, length: 1), withBytes: &currentByte);
        
        return dataOutput.copy() as? NSData
    }
}