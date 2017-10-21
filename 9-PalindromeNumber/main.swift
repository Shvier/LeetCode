//
//  main.swift
//  9-PalindromeNumber
//
//  Created by Shvier on 21/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func isPalindrome(_ x: Int) -> Bool {
        let string = String.init(x)
        var reverseString = ""
        for letter in string.characters {
            reverseString = "\(letter)" + reverseString
        }
        return string == reverseString
    }
    
}

print(Solution.isPalindrome(12321))
