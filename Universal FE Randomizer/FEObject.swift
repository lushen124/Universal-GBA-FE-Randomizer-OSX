//
//  FECharacter.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 10/11/15.
//  Copyright © 2015 Shen Lu. All rights reserved.
//

import Foundation

protocol FEObject {
    var displayName : String {get}
    var objectID : UInt8 {get}
}

protocol FECharacter : FEObject {
    var characterID : UInt8 {get}
}

protocol FEClass : FEObject {
    var classID : UInt8 {get}
}

struct GenericFEObject : FEObject {
    var displayName: String
    var objectID: UInt8
}

struct GenericFECharacter : FECharacter {
    var displayName: String
    var characterID: UInt8
    
    var objectID : UInt8 {
        get {
            return characterID
        }
    }
}

struct GenericFEClass : FEClass {
    var displayName: String
    var classID: UInt8

    var objectID : UInt8 {
        get {
            return classID
        }
    }
}