//
//  FE7.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/12/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Foundation

class FE7: NSObject {
    
}

extension FE7 : BaseGame {
    func playableCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Eliwood", characterID: 0x01),
            GenericFECharacter(displayName: "Hector", characterID: 0x02),
            GenericFECharacter(displayName: "Lyn (Tutorial)", characterID: 0x03),
            GenericFECharacter(displayName: "Raven", characterID: 0x04),
            GenericFECharacter(displayName: "Geitz", characterID: 0x05),
            GenericFECharacter(displayName: "Guy", characterID: 0x06),
            GenericFECharacter(displayName: "Karel", characterID: 0x07),
            GenericFECharacter(displayName: "Dorcas", characterID: 0x08),
            GenericFECharacter(displayName: "Bartre", characterID: 0x09),
            GenericFECharacter(displayName: "Oswin", characterID: 0x0B),
            GenericFECharacter(displayName: "Rebecca", characterID: 0x0E),
            GenericFECharacter(displayName: "Louise", characterID: 0x0F),
            GenericFECharacter(displayName: "Lucius", characterID: 0x10),
            GenericFECharacter(displayName: "Serra", characterID: 0x11),
            GenericFECharacter(displayName: "Renault", characterID: 0x12),
            GenericFECharacter(displayName: "Erk", characterID: 0x13),
            GenericFECharacter(displayName: "Nino", characterID: 0x14),
            GenericFECharacter(displayName: "Pent", characterID: 0x15),
            GenericFECharacter(displayName: "Canas", characterID: 0x16),
            GenericFECharacter(displayName: "Kent (Tutorial)", characterID: 0x17),
            GenericFECharacter(displayName: "Sain (Tutorial)", characterID: 0x18),
            GenericFECharacter(displayName: "Lowen", characterID: 0x19),
            GenericFECharacter(displayName: "Marcus", characterID: 0x1A),
            GenericFECharacter(displayName: "Priscilla", characterID: 0x1B),
            GenericFECharacter(displayName: "Rath (Tutorial)", characterID: 0x1C),
            GenericFECharacter(displayName: "Florina (Tutorial)", characterID: 0x1D),
            GenericFECharacter(displayName: "Fiora", characterID: 0x1E),
            GenericFECharacter(displayName: "Farina", characterID: 0x1F),
            GenericFECharacter(displayName: "Heath", characterID: 0x20),
            GenericFECharacter(displayName: "Vaida", characterID: 0x21),
            GenericFECharacter(displayName: "Hawkeye", characterID: 0x22),
            GenericFECharacter(displayName: "Matthew", characterID: 0x23),
            GenericFECharacter(displayName: "Jaffar", characterID: 0x24),
            GenericFECharacter(displayName: "Ninain", characterID: 0x25),
            GenericFECharacter(displayName: "Nils", characterID: 0x26),
            GenericFECharacter(displayName: "Athos", characterID: 0x27),
            GenericFECharacter(displayName: "Merlinus", characterID: 0x28),
            GenericFECharacter(displayName: "Nils (Final)", characterID: 0x29),
            GenericFECharacter(displayName: "Wallace", characterID: 0x2C),
            GenericFECharacter(displayName: "Lyn", characterID: 0x2D),
            GenericFECharacter(displayName: "Wil", characterID: 0x2E),
            GenericFECharacter(displayName: "Kent", characterID: 0x2F),
            GenericFECharacter(displayName: "Sain", characterID: 0x30),
            GenericFECharacter(displayName: "Florina", characterID: 0x31),
            GenericFECharacter(displayName: "Rath", characterID: 0x32),
            GenericFECharacter(displayName: "Dart", characterID: 0x33),
            GenericFECharacter(displayName: "Isadora", characterID: 0x34),
            GenericFECharacter(displayName: "Legault", characterID: 0x36),
            GenericFECharacter(displayName: "Karla", characterID: 0x37),
            GenericFECharacter(displayName: "Harken", characterID: 0x38)
        ]
    }
    
    func bossCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Groznyi", characterID: 0x3C),
            GenericFECharacter(displayName: "Wire", characterID: 0x3D),
            GenericFECharacter(displayName: "Zagan", characterID: 0x3F),
            GenericFECharacter(displayName: "Boies", characterID: 0x40),
            GenericFECharacter(displayName: "Puzon", characterID: 0x41),
            GenericFECharacter(displayName: "Santals", characterID: 0x43),
//            GenericFECharacter(displayName: "Nergal", characterID: 0x44),
            GenericFECharacter(displayName: "Erik", characterID: 0x45),
            GenericFECharacter(displayName: "Sealen", characterID: 0x46),
            GenericFECharacter(displayName: "Bauker", characterID: 0x47),
            GenericFECharacter(displayName: "Bernard", characterID: 0x48),
            GenericFECharacter(displayName: "Damian", characterID: 0x49),
            GenericFECharacter(displayName: "Zoldam", characterID: 0x4A),
            GenericFECharacter(displayName: "Uhai", characterID: 0x4B),
            GenericFECharacter(displayName: "Aion", characterID: 0x4C),
            GenericFECharacter(displayName: "Darin", characterID: 0x4D),
            GenericFECharacter(displayName: "Cameron", characterID: 0x4E),
            GenericFECharacter(displayName: "Oleg", characterID: 0x4F),
            GenericFECharacter(displayName: "Eubans", characterID: 0x50),
            GenericFECharacter(displayName: "Ursula", characterID: 0x51),
            GenericFECharacter(displayName: "Paul", characterID: 0x53),
            GenericFECharacter(displayName: "Jasmine", characterID: 0x54),
            GenericFECharacter(displayName: "Jerme (Morph)", characterID: 0x56),
            GenericFECharacter(displayName: "Pascal", characterID: 0x57),
            GenericFECharacter(displayName: "Kenneth", characterID: 0x58),
            GenericFECharacter(displayName: "Jerme", characterID: 0x59),
            GenericFECharacter(displayName: "Maxime", characterID: 0x5A),
            GenericFECharacter(displayName: "Sonia", characterID: 0x5B),
            GenericFECharacter(displayName: "Teodor", characterID: 0x5C),
            GenericFECharacter(displayName: "Georg", characterID: 0x5D),
            GenericFECharacter(displayName: "Kaim", characterID: 0x5E),
            GenericFECharacter(displayName: "Denning", characterID: 0x60),
            GenericFECharacter(displayName: "Lloyd (A)", characterID: 0x63),
            GenericFECharacter(displayName: "Linus (A)", characterID: 0x64),
            GenericFECharacter(displayName: "Lloyd (B)", characterID: 0x65),
            GenericFECharacter(displayName: "Linus (B)", characterID: 0x66),
            GenericFECharacter(displayName: "Brendan", characterID: 0x84),
            GenericFECharacter(displayName: "Limstella", characterID: 0x85),
//            GenericFECharacter(displayName: "Dragon", characterID: 0x86),
            GenericFECharacter(displayName: "Batta", characterID: 0x87),
            GenericFECharacter(displayName: "Zugu", characterID: 0x89),
            GenericFECharacter(displayName: "Glass", characterID: 0x8D),
            GenericFECharacter(displayName: "Migal", characterID: 0x8E),
            GenericFECharacter(displayName: "Carjiga", characterID: 0x94),
            GenericFECharacter(displayName: "Bug", characterID: 0x99),
            GenericFECharacter(displayName: "Bool", characterID: 0x9F),
            GenericFECharacter(displayName: "Heintz", characterID: 0xA6),
            GenericFECharacter(displayName: "Beyard", characterID: 0xAD),
            GenericFECharacter(displayName: "Yogi", characterID: 0xB6),
            GenericFECharacter(displayName: "Eagler", characterID: 0xBE),
            GenericFECharacter(displayName: "Lundgren", characterID: 0xC5),
            GenericFECharacter(displayName: "Lloyd (Morph)", characterID: 0xF4),
            GenericFECharacter(displayName: "Linus (Morph)", characterID: 0xF5),
            GenericFECharacter(displayName: "Brendan (Morph)", characterID: 0xF6),
            GenericFECharacter(displayName: "Uhai (Morph)", characterID: 0xF7),
            GenericFECharacter(displayName: "Ursula (Morph)", characterID: 0xF8),
            GenericFECharacter(displayName: "Kenneth (Morph)", characterID: 0xF9),
            GenericFECharacter(displayName: "Darin (Morph)", characterID: 0xFA)
        ]
    }
    
    func eligibleClasses() -> [FEClass] {
        return [ GenericFEClass(displayName: "Lord (Eliwood)", classID: 0x01),
            GenericFEClass(displayName: "Lord (Lyn)", classID: 0x02),
            GenericFEClass(displayName: "Lord (Hector)", classID: 0x03),
            GenericFEClass(displayName: "Lord Knight", classID: 0x07),
            GenericFEClass(displayName: "Blade Lord", classID: 0x08),
            GenericFEClass(displayName: "Great Lord", classID: 0x09),
            GenericFEClass(displayName: "Mercenary", classID: 0x0A),
            GenericFEClass(displayName: "Hero", classID: 0x0C),
            GenericFEClass(displayName: "Myrmidon", classID: 0x0E),
            GenericFEClass(displayName: "Swordmaster", classID: 0x10),
            GenericFEClass(displayName: "Swordmaster (F)", classID: 0x11),
            GenericFEClass(displayName: "Fighter", classID: 0x12),
            GenericFEClass(displayName: "Warrior", classID: 0x13),
            GenericFEClass(displayName: "Knight", classID: 0x14),
            GenericFEClass(displayName: "General", classID: 0x16),
            GenericFEClass(displayName: "Archer", classID: 0x18),
            GenericFEClass(displayName: "Archer (F)", classID: 0x19),
            GenericFEClass(displayName: "Sniper", classID: 0x1A),
            GenericFEClass(displayName: "Sniper (F)", classID: 0x1B),
            GenericFEClass(displayName: "Monk", classID: 0x1C),
            GenericFEClass(displayName: "Cleric", classID: 0x1D),
            GenericFEClass(displayName: "Bishop", classID: 0x1E),
            GenericFEClass(displayName: "Bishop (F)", classID: 0x1F),
            GenericFEClass(displayName: "Mage", classID: 0x20),
            GenericFEClass(displayName: "Mage (F)", classID: 0x21),
            GenericFEClass(displayName: "Sage", classID: 0x22),
            GenericFEClass(displayName: "Sage (F)", classID: 0x23),
            GenericFEClass(displayName: "Shaman", classID: 0x24),
            GenericFEClass(displayName: "Druid", classID: 0x26),
            GenericFEClass(displayName: "Cavalier", classID: 0x28),
            GenericFEClass(displayName: "Paladin", classID: 0x2A),
            GenericFEClass(displayName: "Paladin (F)", classID: 0x2B),
            GenericFEClass(displayName: "Troubadour", classID: 0x2C),
            GenericFEClass(displayName: "Valkyrie", classID: 0x2D),
            GenericFEClass(displayName: "Nomad", classID: 0x2E),
            GenericFEClass(displayName: "Nomad Trooper", classID: 0x30),
            GenericFEClass(displayName: "Pegasus Knight", classID: 0x32),
            GenericFEClass(displayName: "Falcoknight", classID: 0x33),
            GenericFEClass(displayName: "Wyvern Rider", classID: 0x34),
            GenericFEClass(displayName: "Wyvern Lord", classID: 0x36),
            GenericFEClass(displayName: "Wyvern Lord (F)", classID: 0x37),
            GenericFEClass(displayName: "Soldier", classID: 0x38),
            GenericFEClass(displayName: "Brigand", classID: 0x39),
            GenericFEClass(displayName: "Pirate", classID: 0x3A),
            GenericFEClass(displayName: "Berserker", classID: 0x3B),
            GenericFEClass(displayName: "Thief", classID: 0x3C),
            GenericFEClass(displayName: "Assassin", classID: 0x3E),
            GenericFEClass(displayName: "Dancer", classID: 0x40),
            GenericFEClass(displayName: "Bard", classID: 0x41)
//            GenericFEClass(displayName: "Archsage", classID: 0x42)
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
        return [ GenericFECharacter(displayName: "Eliwood", characterID: 0x01),
            GenericFECharacter(displayName: "Hector", characterID: 0x02),
            GenericFECharacter(displayName: "Lyn (Tutorial)", characterID: 0x03),
            GenericFECharacter(displayName: "Lyn", characterID: 0x2D)
        ]
    }
    
    func thiefCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Matthew", characterID: 0x23),
            GenericFECharacter(displayName: "Legault", characterID: 0x36)
        ]
        
    }
    
    func standardClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Mercenary", classID: 0x0A),
            GenericFEClass(displayName: "Hero", classID: 0x0C),
            GenericFEClass(displayName: "Myrmidon", classID: 0x0E),
            GenericFEClass(displayName: "Swordmaster", classID: 0x10),
            GenericFEClass(displayName: "Swordmaster (F)", classID: 0x11),
            GenericFEClass(displayName: "Fighter", classID: 0x12),
            GenericFEClass(displayName: "Warrior", classID: 0x13),
            GenericFEClass(displayName: "Knight", classID: 0x14),
            GenericFEClass(displayName: "General", classID: 0x16),
            GenericFEClass(displayName: "Archer", classID: 0x18),
            GenericFEClass(displayName: "Archer (F)", classID: 0x19),
            GenericFEClass(displayName: "Sniper", classID: 0x1A),
            GenericFEClass(displayName: "Sniper (F)", classID: 0x1B),
            GenericFEClass(displayName: "Monk", classID: 0x1C),
            GenericFEClass(displayName: "Cleric", classID: 0x1D),
            GenericFEClass(displayName: "Bishop", classID: 0x1E),
            GenericFEClass(displayName: "Bishop (F)", classID: 0x1F),
            GenericFEClass(displayName: "Mage", classID: 0x20),
            GenericFEClass(displayName: "Mage (F)", classID: 0x21),
            GenericFEClass(displayName: "Sage", classID: 0x22),
            GenericFEClass(displayName: "Sage (F)", classID: 0x23),
            GenericFEClass(displayName: "Shaman", classID: 0x24),
            GenericFEClass(displayName: "Druid", classID: 0x26),
            GenericFEClass(displayName: "Cavalier", classID: 0x28),
            GenericFEClass(displayName: "Paladin", classID: 0x2A),
            GenericFEClass(displayName: "Paladin (F)", classID: 0x2B),
            GenericFEClass(displayName: "Troubadour", classID: 0x2C),
            GenericFEClass(displayName: "Valkyrie", classID: 0x2D),
            GenericFEClass(displayName: "Nomad", classID: 0x2E),
            GenericFEClass(displayName: "Nomad Trooper", classID: 0x30),
            GenericFEClass(displayName: "Pegasus Knight", classID: 0x32),
            GenericFEClass(displayName: "Falcoknight", classID: 0x33),
            GenericFEClass(displayName: "Wyvern Rider", classID: 0x34),
            GenericFEClass(displayName: "Wyvern Lord", classID: 0x36),
            GenericFEClass(displayName: "Wyvern Lord (F)", classID: 0x37),
            GenericFEClass(displayName: "Pirate", classID: 0x3A),
            GenericFEClass(displayName: "Berserker", classID: 0x3B)
        ]
    }
    
    func extendedClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Soldier", classID: 0x38),
            GenericFEClass(displayName: "Brigand", classID: 0x39),
            GenericFEClass(displayName: "Dancer", classID: 0x40),
            GenericFEClass(displayName: "Bard", classID: 0x41)
        ]
    }
    
    func lordClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Lord (Eliwood)", classID: 0x01),
            GenericFEClass(displayName: "Lord (Lyn)", classID: 0x02),
            GenericFEClass(displayName: "Lord (Hector)", classID: 0x03),
            GenericFEClass(displayName: "Lord Knight", classID: 0x07),
            GenericFEClass(displayName: "Blade Lord", classID: 0x08),
            GenericFEClass(displayName: "Great Lord", classID: 0x09)
        ]
    }
    
    func thiefClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Thief", classID: 0x3C),
            GenericFEClass(displayName: "Assassin", classID: 0x3E)
        ]
    }
    
    func characterLinksForCharacter(character: FECharacter) -> [FECharacter] {
        //GenericFECharacter(displayName: "Lyn (Tutorial)", characterID: 0x03)
        //GenericFECharacter(displayName: "Lyn", characterID: 0x2D)
        if (character.characterID == 0x03 || character.characterID == 0x2D) {
            return [ GenericFECharacter(displayName: "Lyn (Tutorial)", characterID: 0x03),
                GenericFECharacter(displayName: "Lyn", characterID: 0x2D) ]
        }
        
        //GenericFECharacter(displayName: "Kent (Tutorial)", characterID: 0x17)
        //GenericFECharacter(displayName: "Kent", characterID: 0x2F)
        if (character.characterID == 0x17 || character.characterID == 0x2F) {
            return [ GenericFECharacter(displayName: "Kent (Tutorial)", characterID: 0x17),
                GenericFECharacter(displayName: "Kent", characterID: 0x2F) ]
        }
        
        //GenericFECharacter(displayName: "Sain (Tutorial)", characterID: 0x18)
        //GenericFECharacter(displayName: "Sain", characterID: 0x30)
        if (character.characterID == 0x18 || character.characterID == 0x30) {
            return [ GenericFECharacter(displayName: "Sain (Tutorial)", characterID: 0x18),
                GenericFECharacter(displayName: "Sain", characterID: 0x30) ]
        }
        
        //GenericFECharacter(displayName: "Rath (Tutorial)", characterID: 0x1C)
        //GenericFECharacter(displayName: "Rath", characterID: 0x32)
        if (character.characterID == 0x1C || character.characterID == 0x32) {
            return [ GenericFECharacter(displayName: "Rath (Tutorial)", characterID: 0x1C),
                GenericFECharacter(displayName: "Rath", characterID: 0x32) ]
        }
        
        //GenericFECharacter(displayName: "Florina (Tutorial)", characterID: 0x1D)
        //GenericFECharacter(displayName: "Florina", characterID: 0x31)
        if (character.characterID == 0x1D || character.characterID == 0x31) {
            return [ GenericFECharacter(displayName: "Florina (Tutorial)", characterID: 0x1D),
                GenericFECharacter(displayName: "Florina", characterID: 0x31) ]
        }
        
        //GenericFECharacter(displayName: "Nils", characterID: 0x26)
        //GenericFECharacter(displayName: "Nils (Final)", characterID: 0x29)
        if (character.characterID == 0x26 || character.characterID == 0x29) {
            return [ GenericFECharacter(displayName: "Nils", characterID: 0x26),
                GenericFECharacter(displayName: "Nils (Final)", characterID: 0x29) ]
        }
        
        //GenericFECharacter(displayName: "Jerme (Morph)", characterID: 0x56)
        //GenericFECharacter(displayName: "Jerme", characterID: 0x59)
        if (character.characterID == 0x56 || character.characterID == 0x59) {
            return [ GenericFECharacter(displayName: "Jerme (Morph)", characterID: 0x56),
                GenericFECharacter(displayName: "Jerme", characterID: 0x59) ]
        }
        
        //GenericFECharacter(displayName: "Lloyd (A)", characterID: 0x63)
        //GenericFECharacter(displayName: "Lloyd (B)", characterID: 0x65)
        //GenericFECharacter(displayName: "Lloyd (Morph)", characterID: 0xF4)
        if (character.characterID == 0x63 || character.characterID == 0x65 || character.characterID == 0xF4) {
            return [ GenericFECharacter(displayName: "Lloyd (A)", characterID: 0x63),
                GenericFECharacter(displayName: "Lloyd (B)", characterID: 0x65),
                GenericFECharacter(displayName: "Lloyd (Morph)", characterID: 0xF4)]
        }
        
        //GenericFECharacter(displayName: "Linus (A)", characterID: 0x64)
        //GenericFECharacter(displayName: "Linus (B)", characterID: 0x66)
        //GenericFECharacter(displayName: "Linus (Morph)", characterID: 0xF5)
        if (character.characterID == 0x64 || character.characterID == 0x66 || character.characterID == 0xF5) {
            return [ GenericFECharacter(displayName: "Linus (A)", characterID: 0x64),
                GenericFECharacter(displayName: "Linus (B)", characterID: 0x66),
                GenericFECharacter(displayName: "Linus (Morph)", characterID: 0xF5)]
        }
        
        //GenericFECharacter(displayName: "Brendan", characterID: 0x84)
        //GenericFECharacter(displayName: "Brendan (Morph)", characterID: 0xF6)
        if (character.characterID == 0x84 || character.characterID == 0xF6) {
            return [ GenericFECharacter(displayName: "Brendan", characterID: 0x84),
                GenericFECharacter(displayName: "Brendan (Morph)", characterID: 0xF6) ]
        }
        
        //GenericFECharacter(displayName: "Uhai", characterID: 0x4B)
        //GenericFECharacter(displayName: "Uhai (Morph)", characterID: 0xF7)
        if (character.characterID == 0x4B || character.characterID == 0xF7) {
            return [ GenericFECharacter(displayName: "Uhai", characterID: 0x4B),
                GenericFECharacter(displayName: "Uhai (Morph)", characterID: 0xF7) ]
        }
        
        //GenericFECharacter(displayName: "Ursula", characterID: 0x51)
        //GenericFECharacter(displayName: "Ursula (Morph)", characterID: 0xF8)
        if (character.characterID == 0x51 || character.characterID == 0xF8) {
            return [ GenericFECharacter(displayName: "Ursula", characterID: 0x51),
                GenericFECharacter(displayName: "Ursula (Morph)", characterID: 0xF8) ]
        }
        
        //GenericFECharacter(displayName: "Kenneth", characterID: 0x58)
        //GenericFECharacter(displayName: "Kenneth (Morph)", characterID: 0xF9)
        if (character.characterID == 0x58 || character.characterID == 0xF9) {
            return [ GenericFECharacter(displayName: "Kenneth", characterID: 0x58),
                GenericFECharacter(displayName: "Kenneth (Morph)", characterID: 0xF9) ]
        }
        
        //GenericFECharacter(displayName: "Darin", characterID: 0x4D)
        //GenericFECharacter(displayName: "Darin (Morph)", characterID: 0xFA)
        if (character.characterID == 0x4D || character.characterID == 0xFA) {
            return [ GenericFECharacter(displayName: "Darin", characterID: 0x4D),
                GenericFECharacter(displayName: "Darin (Morph)", characterID: 0xFA) ]
        }
        
        return []
    }
}