//
//  RandomizationSettings.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/5/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Foundation

class RandomizationSettings : NSObject {
    
    static let sharedInstance: RandomizationSettings = RandomizationSettings.init()
    
    ////////////////
    // Growths
    ////////////////
    var randomizeGrowthsEnabled: Bool = false
    var growthsMethod: GrowthMethod = GrowthMethod.Variance

    // Parameters for variance method
    var varianceGrowthsVarianceAmount: NSInteger = 1
    
    // Parameters for redistribution method
    var redistributionGrowthsVarianceAmount: NSInteger = 0
    var forceMinimumGrowths: Bool = false
    
    // Parameters for full method
    var minimumAllowedGrowth: NSInteger = 0
    var maximumAllowedGrowth: NSInteger = 255
    
    
    ////////////////
    // Bases
    ////////////////
    var randomizeBasesEnabled: Bool = false
    var baseMethod: BaseMethod = BaseMethod.Variance
    
    // Parameters for variance method
    var varianceBasesVarianceAmount: NSInteger = 1
    
    // Parameters for redistribution method
    var redistributionBasesVarianceAmount: NSInteger = 0
    
    ////////////////
    // Constitution
    ////////////////
    var randomizeConstitutionEnabled: Bool = false
    var constitutionMethod: ConstitutionMethod = ConstitutionMethod.Variance
    
    // Parameters for variance method
    var varianceConstitutionVarianceAmount: NSInteger = 1
    
    // Parameters for full method
    var minimumAllowedConstitution: NSInteger = 1
    var maximumAllowedConstitution: NSInteger = 25
    
    ////////////////
    // Movement
    ////////////////
    var randomizeMovementEnabled: Bool = false
    var movementMethod: MovementMethod = MovementMethod.Variance
    
    // Parameteres for variance method
    var varianceMovementVarianceAmount: NSInteger = 1
    
    // Parameters for full method
    var minimumAllowedMovement: NSInteger = 1
    var maximumAllowedMovement: NSInteger = 9
    
    ////////////////
    // Affinity
    ////////////////
    var randomizeAffinityEnabled: Bool = false
    
    ////////////////
    // Items
    ////////////////
    var randomizeItemsEnabled: Bool = false
    var itemMethod: ItemMethod = ItemMethod.Variance
    
    // Parameters for variance method
    var mightVariance: NSInteger = 1
    var hitVariance: NSInteger = 1
    var critVariance: NSInteger = 1
    var weightVariance: NSInteger = 1
    
    // Parameters for full method
    var mightRange: NSRange = NSMakeRange(0, 20)
    var hitRange: NSRange = NSMakeRange(50, 150)
    var critRange: NSRange = NSMakeRange(0, 100)
    var weightRange: NSRange = NSMakeRange(1, 19)
    
    var addRandomWeaponEffects: Bool = false
    var allowedEffectsFlags: NSInteger = 0xFFFFFFFF
}
