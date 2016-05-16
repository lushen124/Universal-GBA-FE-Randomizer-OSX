//
//  GameController.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 5/15/16.
//  Copyright © 2016 Shen Lu. All rights reserved.
//

import Foundation

class GameController : NSObject {
    
    var fsUrl : NSURL!
    var rawData : NSMutableData?
    
    var baseGame : BaseGame?
    
    init(fileURL: NSURL) {
        fsUrl = fileURL;
        
        super.init();
    }
    
    func validate() -> Bool {
        rawData = NSMutableData.init(contentsOfFile: fsUrl.path!);
        
        if (rawData != nil && rawData!.length > 0xB0) {
            let gameCode : NSData = rawData!.subdataWithRange(NSRange.init(location: 0xAC, length: 4));
        
            let gameCodeString : String = String(data: gameCode, encoding: NSUTF8StringEncoding)!;
            
            if (gameCodeString == "AFEJ") {
                baseGame = FE6()
            }
            if (gameCodeString == "AE7E") {
                baseGame = FE7()
            }
            if (gameCodeString == "BE8E") {
                baseGame = FE8()
            }
        }
        
        if (baseGame == nil) { return false; }
        
        // Check CRC32
        let checksum : CRC32 = CRC32.init(data: rawData!);
        if (checksum.crc == baseGame!.cleanCRC32()) {
            // Attempt to patch.
            let patchPath : String? = NSBundle.mainBundle().pathForResource("FE6-TLRedux-v1.0", ofType: "ups");
            
            let patchedData :NSMutableData = UPSPatcher.sharedInstance.patch(rawData!, patchFilePath:patchPath!)!;
            
            let components : NSURLComponents = NSURLComponents.init(string: fsUrl.absoluteString)!;
            let path : String = components.path!;
            let pathComponents : NSMutableArray = NSMutableArray.init(array:path.componentsSeparatedByString("/"));
            pathComponents.replaceObjectAtIndex(pathComponents.count - 1, withObject: "Patched.gba");
            components.path = pathComponents.componentsJoinedByString("/");
            
            
            patchedData.writeToFile(components.path!, atomically: true);
            
            return true;
        }
        
        return false;
    }
}

