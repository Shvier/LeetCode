//
//  main.swift
//  44-WildcardMatching
//
//  Created by Shvier on 23/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sLength = s.lengthOfBytes(using: .utf8)
        let pLength = p.lengthOfBytes(using: .utf8)
        let sCharacters = [Character](s.characters)
        let pCharacters = [Character](p.characters)
        var i = 0
        var j = 0
        var asterick = -1
        var match = 0
        while i < sLength {
            if j < pLength && pCharacters[j] == "*" {
                match = i
                asterick = j
                j += 1
            } else if j < pLength && (sCharacters[i] == pCharacters[j] || pCharacters[j] == "?") {
                i += 1
                j += 1
            } else if asterick >= 0 {
                match += 1
                i = match
                j = asterick + 1
            } else {
                return false
            }
        }
        while j < pLength && pCharacters[j] == "*" {
            j += 1
        }
        return j == pLength
    }
    
}
