//
//  FE6.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/11/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Foundation

class FE6: NSObject {

}

extension FE6 : BaseGame {
    func playableCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Roy", characterID: 0x01),
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
            ]
    }
    
    func bossCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Damas", characterID: 0x4A),
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
            GenericFECharacter(displayName: "Morgan", characterID: 0xC8)]
    }
    
    func eligibleClasses() -> [FEClass] {
        return [ GenericFEClass(displayName: "Lord", classID: 0x01),
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
        ]
    }
    
    func standardCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Clarine", characterID: 0x02),
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
        ]

    }
    
    func lordCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Roy", characterID: 0x01) ]
    }
    
    func thiefCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Chad", characterID: 0x14),
            GenericFECharacter(displayName: "Astore", characterID: 0x20),
            GenericFECharacter(displayName: "Cath", characterID: 0x35),
        ]

    }
    
    func standardClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Mercenary", classID: 0x02),
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
        ]
    }
    
    func extendedClassList() -> [FEClass] {
        return [
            GenericFEClass(displayName: "Soldier", classID: 0x30),
            GenericFEClass(displayName: "Bandit", classID: 0x31),
            GenericFEClass(displayName: "Bard", classID: 0x36),
            GenericFEClass(displayName: "Dancer", classID: 0x37),
            GenericFEClass(displayName: "Manakete", classID: 0x38),
            GenericFEClass(displayName: "Manakete (F)", classID: 0x39)
        ]
    }
    
    func lordClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Lord", classID: 0x01)]
    }
    
    func thiefClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Thief", classID: 0x34),
            GenericFEClass(displayName: "Thief (F)", classID: 0x35)
        ]
    }
    
    func characterLinksForCharacter(character: FECharacter) -> [FECharacter] {
        // There are no links.
        return []
    }
}