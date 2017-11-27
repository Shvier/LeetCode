//
//  main.swift
//  28-ImplementstrStr()
//
//  Created by Shvier on 27/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let needles = [Character](needle.characters)
        let characters = [Character](haystack.characters)
        for i in 0...Int.max {
            for j in 0...Int.max {
                if j == needles.count {
                    return i
                }
                if (i + j) == characters.count {
                    return -1
                }
                if needles[j] != characters[i+j] {
                    break
                }
            }
        }
        return 0
    }
    
}
