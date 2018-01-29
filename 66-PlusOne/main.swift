//
//  main.swift
//  66-PlusOne
//
//  Created by Shvier on 29/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func plusOne(_ digits: [Int]) -> [Int] {
        let count = digits.count
        var carried = false
        var newDigits = Array(repeating: 1, count: count+1)
        for index in (0..<count).reversed() {
            var current = digits[index]
            if index == count-1 {
                current += 1
            }
            if carried {
                current += 1
                carried = false
            }
            if current > 9 {
                carried = true
                newDigits[index+1] = 0
            } else {
                newDigits[index+1] = current
            }
        }
        if !carried {
            newDigits.removeFirst()
        }
        return newDigits
    }
    
}
