//
//  CGString.swift
//
//  Created by Charles Gorectke on 7/10/14.
//  Copyright (c) 2014 Revision Works, LLC. All rights reserved.
//

import Foundation

extension String {
    func intValue() -> Int? {
        let startIndex = "0"[0]
        let endIndex = "9"[0]
        
        for var i = 0; i < self.utf16Count; i++ {
            let char = self[i]
            if (char < startIndex || char > endIndex) { return nil }
        }
        return NSString(string: self).integerValue
    }
    
    func doubleValue() -> Double? {
        let startIndex = "0"[0]
        let endIndex = "9"[0]
        let dotCode = "."[0]
        
        for var i = 0; i < self.utf16Count; i++ {
            let char = self[i]
            if (char < startIndex || char > endIndex) && char != dotCode { return nil }
        }
        return NSString(string: self).doubleValue
    }
    
    func characterAtIndex(index: Int) -> unichar {
        return self.utf16[index]
    }
    
    subscript(index: Int) -> unichar {
        return characterAtIndex(index)
    }
}