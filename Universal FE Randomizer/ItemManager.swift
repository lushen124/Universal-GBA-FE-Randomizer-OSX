//
//  ItemManager.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/10/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Cocoa

enum WeaponEffects : Int {
    case Poison
    case Eclipse
    case Devil
    case Unbreakable
    case Brave
    case MagicDamage
    case ReverseTriangle
    case StatIncrease
    case AddEffectiveness
    case NegateDefense
    
    case Count
    
    static let allValues = [Poison, Eclipse, Devil, Unbreakable, Brave, MagicDamage, ReverseTriangle, StatIncrease, AddEffectiveness, NegateDefense]
}

class ItemManager: NSObject {
    
    static func friendlyNameForEffect(effect: WeaponEffects) -> String {
        switch (effect) {
        case .Poison:
            return "Poison on Hit"
        case .Eclipse:
            return "Eclipse Effect"
        case .Devil:
            return "Devil Effect"
        case .Unbreakable:
            return "Unbreakable"
        case .Brave:
            return "Brave Effect"
        case .MagicDamage:
            return "Magic Weapon"
        case .ReverseTriangle:
            return "Reverses Triangle"
        case .StatIncrease:
            return "Stat Increase"
        case .AddEffectiveness:
            return "Effectiveness"
        case .NegateDefense:
            return "Negate Defense"
        default:
            return "???"
        }
    }
    
    static func effectMaskForEffect(effect: WeaponEffects) -> NSInteger {
        return 0x1 << effect.rawValue
    }
}
