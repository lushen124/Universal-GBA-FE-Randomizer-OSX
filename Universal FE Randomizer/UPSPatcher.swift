//
//  UPSPatcher.swift
//  Universal FE Randomizer
//
//  Created by Shen Lu on 5/15/16.
//  Copyright © 2016 Shen Lu. All rights reserved.
//

import Foundation

class UPSPatcher : NSObject {
 
    static let sharedInstance: UPSPatcher = UPSPatcher.init()
    
    func patch(sourceData: NSData, patchFilePath: String) -> NSMutableData? {
        let patchData : NSData? = NSData.init(contentsOfFile: patchFilePath);
        
        let destinationData : NSMutableData = sourceData.mutableCopy() as! NSMutableData;
        
        if (patchData != nil) {
            var currentOffset : Int = 0;
            
            // Confirm the patch data header.
            let outBytes : UInt32 = readWord(patchData!);
            currentOffset += 4;
            if (outBytes == 0x55505331) {
                // The first parameter is the input length.
                var result = decodePointer(patchData!.subdataWithRange(NSRange.init(location: currentOffset, length: patchData!.length - currentOffset)));
                var inputLength : UInt32 = result.pointer;
                currentOffset += result.bytesRead;
                inputLength = min(inputLength, UInt32(sourceData.length));
                
                // The second is the output length.
                result = decodePointer(patchData!.subdataWithRange(NSRange.init(location: currentOffset, length: patchData!.length - currentOffset)))
                let outputLength : UInt32 = result.pointer;
                currentOffset += result.bytesRead;
                
                var relative : UInt32 = 0;
                var targetOffset : UInt32 = 0;
                
                while (currentOffset < patchData!.length - 12) {
                    result = decodePointer(patchData!.subdataWithRange(NSRange.init(location: currentOffset, length:patchData!.length - currentOffset)));
                    currentOffset += result.bytesRead;
                    relative = relative + result.pointer;
                    
                    if (relative > outputLength) {
                        continue;
                    }
                    
                    targetOffset = relative;
                    let endIndex = outputLength - 1;
                    
                    for i in targetOffset...endIndex {
                        var delta : UInt8 = 0;
                        patchData!.subdataWithRange(NSRange.init(location: currentOffset, length: 1)).getBytes(&delta, length: 1);
                        currentOffset += 1;
                        if (delta == 0) {
                            relative += 1;
                            break;
                        }
                        
                        if (i < outputLength) {
                            // Read byte from source file (0x00 if beyond bounds)
                            // XOR and write into target file.
                            var currentByte : UInt8 = 0;
                            if ((i < inputLength) && (relative < UInt32(sourceData.length))) {
                                sourceData.getBytes(&currentByte, range: NSRange.init(location: Int(relative), length: 1));
                            }
                            
                            while (destinationData.length < Int(targetOffset + 1)) {
                                destinationData.appendBytes([0], length: 1);
                            }
                            destinationData.replaceBytesInRange(NSRange.init(location: Int(targetOffset), length: 1), withBytes: [delta ^ currentByte]);
                            targetOffset += 1;
                        }
                        
                        relative += 1;
                    }
                }
            }
        }
        
        return destinationData;
    }
    
    func decodePointer(data: NSData) -> (pointer: UInt32, bytesRead: Int) {
        var offset : UInt32 = 0;
        var shift : UInt32 = 1;
        var index : Int = 0;
        
        while true {
            var input : UInt8 = 0;
            data.getBytes(&input, range: NSRange.init(location: index, length: 1));
            index += 1;
            offset += UInt32((input & 0x7F)) * shift;
            if (input & 0x80 != 0) {
                break;
            }
            shift <<= 7;
            offset += shift;
        }
        
        return (offset, index);
    }
    
    func readWord(data: NSData) -> UInt32 {
        var result : UInt32 = 0;
        
        var currentByte : UInt8 = 0;
        
        data.getBytes(&currentByte, length: 1);
        
        result = result | UInt32(currentByte);
        
        data.getBytes(&currentByte, range: NSRange.init(location: 1, length: 1));
        
        result = (result << 8) | UInt32(currentByte);
        
        data.getBytes(&currentByte, range: NSRange.init(location: 2, length: 1));
        
        result = (result << 8) | UInt32(currentByte);
        
        data.getBytes(&currentByte, range: NSRange.init(location: 3, length: 1));
        
        result = (result << 8) | UInt32(currentByte);
        
        return result;
    }
}