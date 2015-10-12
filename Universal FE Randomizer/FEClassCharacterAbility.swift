//
//  FEClassCharacterAbility.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/11/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Foundation

enum ClassCharacterAbility1 : UInt8 {
    case None = 0x0
    case MountedAidSystem = 0x1
    case MoveAgain = 0x2
    case Steal = 0x4
    case Lockpicks = 0x8
    case Dance = 0x10
    case Play = 0x20
    case CriticalBoost = 0x40
    case Ballista = 0x80
}

enum ClassCharacterAbility2 : UInt8 {
    case None = 0x0
    case Promoted = 0x1
    case SupplyDepot = 0x2
    case ShowHorseIcon = 0x4
    case ShowDragonIcon = 0x8
    case ShowPegasusIcon = 0x10
    case Lord = 0x20
    case Female = 0x40
    case Boss = 0x80
}

enum ClassCharacterAbility3 : UInt8 {
    case None = 0x0
    case FE6CanUseLordWeapons = 0x1
    case CanUseWoDaoAndShamshir = 0x2
    case CanUseDragonstone = 0x4
    case IsMorphOrMaxLevel10 = 0x8
    case Uncontrollable = 0x10
    case PegasusKnightTriangle = 0x20
    case ArmorKnightTriangle = 0x40
    case StartsAsNPC = 0x80
}

// Not defined for FE6
enum ClassCharacterAbility4 : UInt8 {
    case None = 0x0
    case NoExperience = 0x1
    case Lethality = 0x2
    case FE7SealsMagic = 0x4
    case DropsLastItemOrSummon = 0x8
    case EliwoodEirikaWeaponLock = 0x10
    case HectorEphraimWeaponLock = 0x20
    case LynWeaponLock = 0x40
    case AthosWeaponLock = 0x80
}