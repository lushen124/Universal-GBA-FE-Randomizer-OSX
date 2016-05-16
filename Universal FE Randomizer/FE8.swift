//
//  FE8.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/12/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Foundation

class FE8: NSObject {
    
}

extension FE8 : BaseGame {
    
    func gameTitle() -> String {
        return "Fire Emblem 8: The Sacred Stones"
    }
    
    func cleanCRC32() -> UInt32 {
        return 0;
    }
    
    func characterTableOffsetAddress() -> Int {
        return 0;
    }
    
    func defaultCharacterTableOffset() -> Int {
        return 0;
    }
    
    func defaultCharacterCount() -> Int {
        return 0;
    }
    
    func playableCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Eirika", characterID: 0x01),
            GenericFECharacter(displayName: "Seth", characterID: 0x02),
            GenericFECharacter(displayName: "Gilliam", characterID: 0x03),
            GenericFECharacter(displayName: "Franz", characterID: 0x04),
            GenericFECharacter(displayName: "Moulder", characterID: 0x05),
            GenericFECharacter(displayName: "Vanessa", characterID: 0x06),
            GenericFECharacter(displayName: "Ross", characterID: 0x07),
            GenericFECharacter(displayName: "Neimi", characterID: 0x08),
            GenericFECharacter(displayName: "Colm", characterID: 0x09),
            GenericFECharacter(displayName: "Garcia", characterID: 0x0A),
            GenericFECharacter(displayName: "Innes", characterID: 0x0B),
            GenericFECharacter(displayName: "Lute", characterID: 0x0C),
            GenericFECharacter(displayName: "Natasha", characterID: 0x0D),
            GenericFECharacter(displayName: "Cormag", characterID: 0x0E),
            GenericFECharacter(displayName: "Ephraim", characterID: 0x0F),
            GenericFECharacter(displayName: "Forde", characterID: 0x10),
            GenericFECharacter(displayName: "Kyle", characterID: 0x11),
            GenericFECharacter(displayName: "Amelia", characterID: 0x12),
            GenericFECharacter(displayName: "Artur", characterID: 0x13),
            GenericFECharacter(displayName: "Gerik", characterID: 0x14),
            GenericFECharacter(displayName: "Tethys", characterID: 0x15),
            GenericFECharacter(displayName: "Marisa", characterID: 0x16),
            GenericFECharacter(displayName: "Saleh", characterID: 0x17),
            GenericFECharacter(displayName: "Ewan", characterID: 0x18),
            GenericFECharacter(displayName: "L'Arachel", characterID: 0x19),
            GenericFECharacter(displayName: "Dozla", characterID: 0x1A),

            GenericFECharacter(displayName: "Rennac", characterID: 0x1C),
            GenericFECharacter(displayName: "Duessel", characterID: 0x1D),
            GenericFECharacter(displayName: "Myrrh", characterID: 0x1E),
            GenericFECharacter(displayName: "Knoll", characterID: 0x1F),
            GenericFECharacter(displayName: "Joshua", characterID: 0x20),
            GenericFECharacter(displayName: "Syrene", characterID: 0x21),
            GenericFECharacter(displayName: "Tana", characterID: 0x22),
            
//            GenericFECharacter(displayName: "Lyon", characterID: 0x23),
//            GenericFECharacter(displayName: "Orson", characterID: 0x24),
            GenericFECharacter(displayName: "Glen", characterID: 0x25),
//            GenericFECharacter(displayName: "Selena", characterID: 0x26),
//            GenericFECharacter(displayName: "Valter", characterID: 0x27),
//            GenericFECharacter(displayName: "Riev", characterID: 0x28),
//            GenericFECharacter(displayName: "Caellach", characterID: 0x29),
            GenericFECharacter(displayName: "Fado", characterID: 0x2A),
            GenericFECharacter(displayName: "Ismaire", characterID: 0x2B),
            GenericFECharacter(displayName: "Hayden", characterID: 0x2C)
        ]
    }
    
    func bossCharacterList() -> [FECharacter] {
        return [             /*GenericFECharacter(displayName: "Lyon", characterID: 0x23),*/
//            GenericFECharacter(displayName: "Orson", characterID: 0x24),
//            GenericFECharacter(displayName: "Glen", characterID: 0x25),
//            GenericFECharacter(displayName: "Selena", characterID: 0x26),
//            GenericFECharacter(displayName: "Valter", characterID: 0x27),
//            GenericFECharacter(displayName: "Riev", characterID: 0x28),
//            GenericFECharacter(displayName: "Caellach", characterID: 0x29),
//            GenericFECharacter(displayName: "Fado", characterID: 0x2A),
//            GenericFECharacter(displayName: "Ismaire", characterID: 0x2B),
//            GenericFECharacter(displayName: "Hayden", characterID: 0x2C),
//            GenericFECharacter(displayName: "Lyon (Ch. 17)", characterID: 0x40),
//            GenericFECharacter(displayName: "Morva", characterID: 0x41),
//            GenericFECharacter(displayName: "Orson (Ch. 5x)", characterID: 0x42),
            GenericFECharacter(displayName: "Valter", characterID: 0x43), // Ch. 15
            GenericFECharacter(displayName: "Selena", characterID: 0x44), // Ch 10B, 13B
//            GenericFECharacter(displayName: "Valter (Prologue)", characterID: 0x45),
            GenericFECharacter(displayName: "Breguet", characterID: 0x46),
            GenericFECharacter(displayName: "Bone", characterID: 0x47),
            GenericFECharacter(displayName: "Bazba", characterID: 0x48),
            GenericFECharacter(displayName: "Entombed (Ch. 4)", characterID: 0x49),
            GenericFECharacter(displayName: "Saar", characterID: 0x4A),
            GenericFECharacter(displayName: "Novala", characterID: 0x4B),
            GenericFECharacter(displayName: "Murray", characterID: 0x4C),
            GenericFECharacter(displayName: "Tirado", characterID: 0x4D),
            GenericFECharacter(displayName: "Binks", characterID: 0x4E),
            GenericFECharacter(displayName: "Pablo", characterID: 0x4F), // Ch. 10A
            GenericFECharacter(displayName: "Maelduin (Ch. 12A)", characterID: 0x50),
            GenericFECharacter(displayName: "Aias", characterID: 0x51),
            GenericFECharacter(displayName: "Carlyle", characterID: 0x52),
            GenericFECharacter(displayName: "Caellach", characterID: 0x53), // Ch. 15
//            GenericFECharacter(displayName: "Pablo (Ch. 13A)", characterID: 0x54),
            GenericFECharacter(displayName: "Gorgon (Ch. 18)", characterID: 0x56),
            GenericFECharacter(displayName: "Riev", characterID: 0x57),
            GenericFECharacter(displayName: "Gheb", characterID: 0x5A),
            GenericFECharacter(displayName: "Beran", characterID: 0x5B),
            GenericFECharacter(displayName: "Cyclops (Ch. 12B)", characterID: 0x5C),
            GenericFECharacter(displayName: "Wight (Ch. 11A)", characterID: 0x5D),
            GenericFECharacter(displayName: "Deathgoyle (Ch. 11B)", characterID: 0x5E),
//            GenericFECharacter(displayName: "Mummy", characterID: 0x5F), // ?
            GenericFECharacter(displayName: "O'Neill", characterID: 0x68),
//            GenericFECharacter(displayName: "Glen (Cutscene)", characterID: 0x69),
            GenericFECharacter(displayName: "Zonta", characterID: 0x6A),
            GenericFECharacter(displayName: "Vigarde", characterID: 0x6B),
//            GenericFECharacter(displayName: "Lyon (Final)", characterID: 0x6C),
            GenericFECharacter(displayName: "Orson", characterID: 0x6D) // Ch. 16
//            GenericFECharacter(displayName: "Demon King", characterID: 0xBE)
        ]
    }
    
    func eligibleClasses() -> [FEClass] {
        return [ GenericFEClass(displayName: "Lord (Ephraim)", classID: 0x01),
            GenericFEClass(displayName: "Lord (Eirika)", classID: 0x02),
            GenericFEClass(displayName: "Master Lord (Ephraim)", classID: 0x03),
            GenericFEClass(displayName: "Master Lord (Eirika)", classID: 0x04),
            GenericFEClass(displayName: "Cavalier", classID: 0x05),
            GenericFEClass(displayName: "Cavalier (F)", classID: 0x06),
            GenericFEClass(displayName: "Paladin", classID: 0x07),
            GenericFEClass(displayName: "Paladin (F)", classID: 0x08),
            GenericFEClass(displayName: "Armor Knight", classID: 0x09),
            GenericFEClass(displayName: "Armor Knight (F)", classID: 0x0A),
            GenericFEClass(displayName: "General", classID: 0x0B),
            GenericFEClass(displayName: "General (F)", classID: 0x0C),
            GenericFEClass(displayName: "Thief", classID: 0x0D),
//            GenericFEClass(displayName: "Manakete", classID: 0x0E),
            GenericFEClass(displayName: "Mercenary", classID: 0x0F),
//            GenericFEClass(displayName: "Mercenary (F)", classID: 0x10),
            GenericFEClass(displayName: "Hero", classID: 0x11),
//            GenericFEClass(displayName: "Hero (F)", classID: 0x12),
            GenericFEClass(displayName: "Myrmidon", classID: 0x13),
            GenericFEClass(displayName: "Myrmidon (F)", classID: 0x14),
            GenericFEClass(displayName: "Swordmaster", classID: 0x15),
            GenericFEClass(displayName: "Swordmaster (F)", classID: 0x16),
            GenericFEClass(displayName: "Assassin", classID: 0x17),
            GenericFEClass(displayName: "Assassin (F)", classID: 0x18),
            GenericFEClass(displayName: "Archer", classID: 0x19),
            GenericFEClass(displayName: "Archer (F)", classID: 0x1A),
            GenericFEClass(displayName: "Sniper", classID: 0x1B),
            GenericFEClass(displayName: "Sniper (F)", classID: 0x1C),
            GenericFEClass(displayName: "Ranger", classID: 0x1D),
            GenericFEClass(displayName: "Ranger (F)", classID: 0x1E),
            GenericFEClass(displayName: "Wyvern Rider", classID: 0x1F),
//            GenericFEClass(displayName: "Wyvern Rider (F)", classID: 0x20),
            GenericFEClass(displayName: "Wyvern Lord", classID: 0x21),
//            GenericFEClass(displayName: "Wyvern Lord (F)", classID: 0x22),
            GenericFEClass(displayName: "Wyvern Knight", classID: 0x23),
            GenericFEClass(displayName: "Wyvern Knight (F)", classID: 0x24),
            GenericFEClass(displayName: "Mage", classID: 0x25),
            GenericFEClass(displayName: "Mage (F)", classID: 0x26),
            GenericFEClass(displayName: "Sage", classID: 0x27),
            GenericFEClass(displayName: "Sage (F)", classID: 0x28),
            GenericFEClass(displayName: "Mage Knight", classID: 0x29),
            GenericFEClass(displayName: "Mage Knight (F)", classID: 0x2A),
            GenericFEClass(displayName: "Bishop", classID: 0x2B),
            GenericFEClass(displayName: "Bishop (F)", classID: 0x2C),
            GenericFEClass(displayName: "Shaman", classID: 0x2D),
//            GenericFEClass(displayName: "Shaman (F)", classID: 0x2E),
            GenericFEClass(displayName: "Druid", classID: 0x2F),
//            GenericFEClass(displayName: "Druid (F)", classID: 0x30),
            GenericFEClass(displayName: "Summoner", classID: 0x31),
//            GenericFEClass(displayName: "Summoner (F)", classID: 0x32),
            GenericFEClass(displayName: "Rogue", classID: 0x33),
            GenericFEClass(displayName: "Great Knight", classID: 0x35),
            GenericFEClass(displayName: "Great Knight (F)", classID: 0x36),
            GenericFEClass(displayName: "Recruit (2)", classID: 0x37),
            GenericFEClass(displayName: "Super Journeyman", classID: 0x38),
            GenericFEClass(displayName: "Super Pupil", classID: 0x39),
            GenericFEClass(displayName: "Super Recruit", classID: 0x3A),
//            GenericFEClass(displayName: "Manakete (2)", classID: 0x3B),
            GenericFEClass(displayName: "Manakete (F)", classID: 0x3C),
            GenericFEClass(displayName: "Journeyman", classID: 0x3D),
            GenericFEClass(displayName: "Pupil", classID: 0x3E),
            GenericFEClass(displayName: "Fighter", classID: 0x3F),
            GenericFEClass(displayName: "Warrior", classID: 0x40),
            GenericFEClass(displayName: "Brigand", classID: 0x41),
            GenericFEClass(displayName: "Pirate", classID: 0x42),
            GenericFEClass(displayName: "Berserker", classID: 0x43),
            GenericFEClass(displayName: "Monk", classID: 0x44),
            GenericFEClass(displayName: "Priest", classID: 0x45),
//            GenericFEClass(displayName: "Bard", classID: 0x46),
            GenericFEClass(displayName: "Recruit", classID: 0x47),
            GenericFEClass(displayName: "Pegasus Knight", classID: 0x48),
            GenericFEClass(displayName: "Falcoknight", classID: 0x49),
            GenericFEClass(displayName: "Cleric", classID: 0x4A),
            GenericFEClass(displayName: "Troubadour", classID: 0x4B),
            GenericFEClass(displayName: "Valkyrie", classID: 0x4C),
            GenericFEClass(displayName: "Dancer", classID: 0x4D),
            GenericFEClass(displayName: "Soldier", classID: 0x4E),
//            GenericFEClass(displayName: "Necromancer", classID: 0x4F),
//            GenericFEClass(displayName: "Fleet", classID: 0x50),
//            GenericFEClass(displayName: "GhostFighter", classID: 0x51),
            
            GenericFEClass(displayName: "Revenant", classID: 0x52),
            GenericFEClass(displayName: "Entombed", classID: 0x53),
            GenericFEClass(displayName: "Skeleton", classID: 0x54),
            GenericFEClass(displayName: "Skeleton (Bow)", classID: 0x55),
            GenericFEClass(displayName: "Wight", classID: 0x56),
            GenericFEClass(displayName: "Wight (Bow)", classID: 0x57),
            GenericFEClass(displayName: "Bael", classID: 0x58),
            GenericFEClass(displayName: "Elder Bael", classID: 0x59),
            GenericFEClass(displayName: "Cyclops", classID: 0x5A),
            GenericFEClass(displayName: "Mauthe Doog", classID: 0x5B),
            GenericFEClass(displayName: "Gwyllgi", classID: 0x5C),
            GenericFEClass(displayName: "Tarvos", classID: 0x5D),
            GenericFEClass(displayName: "Maelduin", classID: 0x5E),
            GenericFEClass(displayName: "Mogall", classID: 0x5F),
            GenericFEClass(displayName: "Arch Mogall", classID: 0x60),
            GenericFEClass(displayName: "Gorgon", classID: 0x61),
            GenericFEClass(displayName: "Gargoyle", classID: 0x63),
            GenericFEClass(displayName: "Deathgoyle", classID: 0x64),
//            GenericFEClass(displayName: "Draco Zombie", classID: 0x65),
            
//            GenericFEClass(displayName: "Demon King", classID: 0x66),
            
//            GenericFEClass(displayName: "Cyclops (2)", classID: 0x7C),
//            GenericFEClass(displayName: "Elder Bael (2)", classID: 0x7D),
            GenericFEClass(displayName: "Journeyman (2)", classID: 0x7E),
            GenericFEClass(displayName: "Pupil (2)", classID: 0x7F)
        ]
    }
    
    func standardCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Seth", characterID: 0x02),
            GenericFECharacter(displayName: "Gilliam", characterID: 0x03),
            GenericFECharacter(displayName: "Franz", characterID: 0x04),
            GenericFECharacter(displayName: "Moulder", characterID: 0x05),
            GenericFECharacter(displayName: "Vanessa", characterID: 0x06),
            GenericFECharacter(displayName: "Ross", characterID: 0x07),
            GenericFECharacter(displayName: "Neimi", characterID: 0x08),
            GenericFECharacter(displayName: "Garcia", characterID: 0x0A),
            GenericFECharacter(displayName: "Innes", characterID: 0x0B),
            GenericFECharacter(displayName: "Lute", characterID: 0x0C),
            GenericFECharacter(displayName: "Natasha", characterID: 0x0D),
            GenericFECharacter(displayName: "Cormag", characterID: 0x0E),
            GenericFECharacter(displayName: "Forde", characterID: 0x10),
            GenericFECharacter(displayName: "Kyle", characterID: 0x11),
            GenericFECharacter(displayName: "Amelia", characterID: 0x12),
            GenericFECharacter(displayName: "Artur", characterID: 0x13),
            GenericFECharacter(displayName: "Gerik", characterID: 0x14),
            GenericFECharacter(displayName: "Tethys", characterID: 0x15),
            GenericFECharacter(displayName: "Marisa", characterID: 0x16),
            GenericFECharacter(displayName: "Saleh", characterID: 0x17),
            GenericFECharacter(displayName: "Ewan", characterID: 0x18),
            GenericFECharacter(displayName: "L'Arachel", characterID: 0x19),
            GenericFECharacter(displayName: "Dozla", characterID: 0x1A),
            
            GenericFECharacter(displayName: "Duessel", characterID: 0x1D),
            GenericFECharacter(displayName: "Myrrh", characterID: 0x1E),
            GenericFECharacter(displayName: "Knoll", characterID: 0x1F),
            GenericFECharacter(displayName: "Joshua", characterID: 0x20),
            GenericFECharacter(displayName: "Syrene", characterID: 0x21),
            GenericFECharacter(displayName: "Tana", characterID: 0x22),

            GenericFECharacter(displayName: "Glen", characterID: 0x25),
            GenericFECharacter(displayName: "Fado", characterID: 0x2A),
            GenericFECharacter(displayName: "Ismaire", characterID: 0x2B),
            GenericFECharacter(displayName: "Hayden", characterID: 0x2C)
        ]
        
    }
    
    func lordCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Eirika", characterID: 0x01),
            GenericFECharacter(displayName: "Ephraim", characterID: 0x0F)
        ]
    }
    
    func thiefCharacterList() -> [FECharacter] {
        return [ GenericFECharacter(displayName: "Colm", characterID: 0x09),
            GenericFECharacter(displayName: "Rennac", characterID: 0x1C)
        ]
        
    }
    
    func standardClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Cavalier", classID: 0x05),
            GenericFEClass(displayName: "Cavalier (F)", classID: 0x06),
            GenericFEClass(displayName: "Paladin", classID: 0x07),
            GenericFEClass(displayName: "Paladin (F)", classID: 0x08),
            GenericFEClass(displayName: "Armor Knight", classID: 0x09),
            GenericFEClass(displayName: "Armor Knight (F)", classID: 0x0A),
            GenericFEClass(displayName: "General", classID: 0x0B),
            GenericFEClass(displayName: "General (F)", classID: 0x0C),
            GenericFEClass(displayName: "Mercenary", classID: 0x0F),
            GenericFEClass(displayName: "Hero", classID: 0x11),
            GenericFEClass(displayName: "Myrmidon", classID: 0x13),
            GenericFEClass(displayName: "Myrmidon (F)", classID: 0x14),
            GenericFEClass(displayName: "Swordmaster", classID: 0x15),
            GenericFEClass(displayName: "Swordmaster (F)", classID: 0x16),
            GenericFEClass(displayName: "Archer", classID: 0x19),
            GenericFEClass(displayName: "Archer (F)", classID: 0x1A),
            GenericFEClass(displayName: "Sniper", classID: 0x1B),
            GenericFEClass(displayName: "Sniper (F)", classID: 0x1C),
            GenericFEClass(displayName: "Ranger", classID: 0x1D),
            GenericFEClass(displayName: "Ranger (F)", classID: 0x1E),
            GenericFEClass(displayName: "Wyvern Rider", classID: 0x1F),
            GenericFEClass(displayName: "Wyvern Lord", classID: 0x21),
            GenericFEClass(displayName: "Wyvern Knight", classID: 0x23),
            GenericFEClass(displayName: "Wyvern Knight (F)", classID: 0x24),
            GenericFEClass(displayName: "Mage", classID: 0x25),
            GenericFEClass(displayName: "Mage (F)", classID: 0x26),
            GenericFEClass(displayName: "Sage", classID: 0x27),
            GenericFEClass(displayName: "Sage (F)", classID: 0x28),
            GenericFEClass(displayName: "Mage Knight", classID: 0x29),
            GenericFEClass(displayName: "Mage Knight (F)", classID: 0x2A),
            GenericFEClass(displayName: "Bishop", classID: 0x2B),
            GenericFEClass(displayName: "Bishop (F)", classID: 0x2C),
            GenericFEClass(displayName: "Shaman", classID: 0x2D),
            GenericFEClass(displayName: "Druid", classID: 0x2F),
            GenericFEClass(displayName: "Summoner", classID: 0x31),
            GenericFEClass(displayName: "Great Knight", classID: 0x35),
            GenericFEClass(displayName: "Great Knight (F)", classID: 0x36),
            GenericFEClass(displayName: "Fighter", classID: 0x3F),
            GenericFEClass(displayName: "Warrior", classID: 0x40),
            GenericFEClass(displayName: "Pirate", classID: 0x42),
            GenericFEClass(displayName: "Berserker", classID: 0x43),
            GenericFEClass(displayName: "Monk", classID: 0x44),
            GenericFEClass(displayName: "Priest", classID: 0x45),
            GenericFEClass(displayName: "Pegasus Knight", classID: 0x48),
            GenericFEClass(displayName: "Falcoknight", classID: 0x49),
            GenericFEClass(displayName: "Cleric", classID: 0x4A),
            GenericFEClass(displayName: "Troubadour", classID: 0x4B),
            GenericFEClass(displayName: "Valkyrie", classID: 0x4C)
        ]
    }
    
    func extendedClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Recruit (2)", classID: 0x37),
            GenericFEClass(displayName: "Super Journeyman", classID: 0x38),
            GenericFEClass(displayName: "Super Pupil", classID: 0x39),
            GenericFEClass(displayName: "Super Recruit", classID: 0x3A),
            GenericFEClass(displayName: "Manakete (F)", classID: 0x3C),
            GenericFEClass(displayName: "Journeyman", classID: 0x3D),
            GenericFEClass(displayName: "Pupil", classID: 0x3E),
            GenericFEClass(displayName: "Brigand", classID: 0x41),
            GenericFEClass(displayName: "Recruit", classID: 0x47),
            GenericFEClass(displayName: "Dancer", classID: 0x4D),
            GenericFEClass(displayName: "Soldier", classID: 0x4E),
            
            GenericFEClass(displayName: "Revenant", classID: 0x52),
            GenericFEClass(displayName: "Entombed", classID: 0x53),
            GenericFEClass(displayName: "Skeleton", classID: 0x54),
            GenericFEClass(displayName: "Skeleton (Bow)", classID: 0x55),
            GenericFEClass(displayName: "Wight", classID: 0x56),
            GenericFEClass(displayName: "Wight (Bow)", classID: 0x57),
            GenericFEClass(displayName: "Bael", classID: 0x58),
            GenericFEClass(displayName: "Elder Bael", classID: 0x59),
            GenericFEClass(displayName: "Cyclops", classID: 0x5A),
            GenericFEClass(displayName: "Mauthe Doog", classID: 0x5B),
            GenericFEClass(displayName: "Gwyllgi", classID: 0x5C),
            GenericFEClass(displayName: "Tarvos", classID: 0x5D),
            GenericFEClass(displayName: "Maelduin", classID: 0x5E),
            GenericFEClass(displayName: "Mogall", classID: 0x5F),
            GenericFEClass(displayName: "Arch Mogall", classID: 0x60),
            GenericFEClass(displayName: "Gorgon", classID: 0x61),
            GenericFEClass(displayName: "Gargoyle", classID: 0x63),
            GenericFEClass(displayName: "Deathgoyle", classID: 0x64),

            GenericFEClass(displayName: "Journeyman (2)", classID: 0x7E),
            GenericFEClass(displayName: "Pupil (2)", classID: 0x7F)
        ]
    }
    
    func lordClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Lord (Ephraim)", classID: 0x01),
            GenericFEClass(displayName: "Lord (Eirika)", classID: 0x02),
            GenericFEClass(displayName: "Master Lord (Ephraim)", classID: 0x03),
            GenericFEClass(displayName: "Master Lord (Eirika)", classID: 0x04)
        ]
    }
    
    func thiefClassList() -> [FEClass] {
        return [ GenericFEClass(displayName: "Thief", classID: 0x0D),
            GenericFEClass(displayName: "Assassin", classID: 0x17),
            GenericFEClass(displayName: "Assassin (F)", classID: 0x18),
            GenericFEClass(displayName: "Rogue", classID: 0x33)
        ]
    }
    
    func characterLinksForCharacter(character: FECharacter) -> [FECharacter] {
        //GenericFECharacter(displayName: "Lyon", characterID: 0x23)
        //GenericFECharacter(displayName: "Lyon (Ch. 17)", characterID: 0x40)
        //GenericFECharacter(displayName: "Lyon (Final)", characterID: 0x6C)
        if (character.characterID == 0x23 || character.characterID == 0x40 || character.characterID == 0x6C) {
            return [ GenericFECharacter(displayName: "Lyon", characterID: 0x23),
                GenericFECharacter(displayName: "Lyon (Ch. 17)", characterID: 0x40),
                GenericFECharacter(displayName: "Lyon (Final)", characterID: 0x6C)]
        }
        
        //GenericFECharacter(displayName: "Glen", characterID: 0x25)
        //GenericFECharacter(displayName: "Glen (Cutscene)", characterID: 0x69)
        if (character.characterID == 0x25 || character.characterID == 0x69) {
            return [ GenericFECharacter(displayName: "Glen", characterID: 0x25),
                GenericFECharacter(displayName: "Glen (Cutscene)", characterID: 0x69) ]
        }
        
        //GenericFECharacter(displayName: "Orson", characterID: 0x24)
        //GenericFECharacter(displayName: "Orson (Ch. 16)", characterID: 0x6D)
        //GenericFECharacter(displayName: "Orson (Ch. 5x)", characterID: 0x42)
        if (character.characterID == 0x24 || character.characterID == 0x6D || character.characterID == 0x42) {
            return [ GenericFECharacter(displayName: "Orson", characterID: 0x24),
                GenericFECharacter(displayName: "Orson (Ch. 16)", characterID: 0x6D),
                GenericFECharacter(displayName: "Orson (Ch. 5x)", characterID: 0x42)]
        }
        
        //GenericFECharacter(displayName: "Selena", characterID: 0x26)
        //GenericFECharacter(displayName: "Selena (Ch. 10B, Ch. 13B)", characterID: 0x44)
        if (character.characterID == 0x26 || character.characterID == 0x44) {
            return [ GenericFECharacter(displayName: "Selena", characterID: 0x26),
                GenericFECharacter(displayName: "Selena (Ch. 10B, Ch. 13B)", characterID: 0x44) ]
        }
        
        //GenericFECharacter(displayName: "Valter", characterID: 0x27)
        //GenericFECharacter(displayName: "Valter (Ch. 15)", characterID: 0x43)
        //GenericFECharacter(displayName: "Valter (Prologue)", characterID: 0x45)
        if (character.characterID == 0x27 || character.characterID == 0x43 || character.characterID == 0x45) {
            return [ GenericFECharacter(displayName: "Valter", characterID: 0x27),
                GenericFECharacter(displayName: "Valter (Ch. 15)", characterID: 0x43),
                GenericFECharacter(displayName: "Valter (Prologue)", characterID: 0x45)]
        }
        
        //GenericFECharacter(displayName: "Riev", characterID: 0x28)
        //GenericFECharacter(displayName: "Riev (Ch. 19, Ch. 20)", characterID: 0x57)
        if (character.characterID == 0x28 || character.characterID == 0x57) {
            return [ GenericFECharacter(displayName: "Riev", characterID: 0x28),
                GenericFECharacter(displayName: "Riev (Ch. 19, Ch. 20)", characterID: 0x57) ]
        }
        
        //GenericFECharacter(displayName: "Caellach", characterID: 0x29)
        //GenericFECharacter(displayName: "Caellach (Ch. 15)", characterID: 0x53)
        if (character.characterID == 0x29 || character.characterID == 0x53) {
            return [ GenericFECharacter(displayName: "Caellach", characterID: 0x29),
                GenericFECharacter(displayName: "Caellach (Ch. 15)", characterID: 0x53) ]
        }
                
        return []
    }
}