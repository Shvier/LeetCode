//
//  main.swift
//  3-LongestSubstringWithoutRepeatingCharacters
//
//  Created by Shvier on 11/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        let characters = [Character](s.characters)
        var hashArray = Array(repeating: Int(), count: 256)
        var length: Int = 0
        var left: Int = 0
        for i in 0..<characters.count {
            let character = String(characters[i])
            let asc: Int = Int((character.unicodeScalars.filter{$0.isASCII}.first?.value)!)
            if hashArray[asc] == 0 || hashArray[asc] < left {
                length = max(length, i - left + 1)
            } else {
                left = hashArray[asc]
            }
            hashArray[asc] = i + 1
        }
        return length
    }
}

print(Solution.lengthOfLongestSubstring("nfpdmpi"))
