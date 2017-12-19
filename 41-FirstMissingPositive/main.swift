//
//  main.swift
//  41-FirstMissingPositive
//
//  Created by Shvier on 19/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        var result = 0
        var index = 0
        let count = sortedNums.count
        while index < count && sortedNums[index] <= 0 {
            index += 1
        }
        for i in index..<count {
            if i > 0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }
            if (sortedNums[i] - result) != 1 {
                return result + 1
            } else {
                result = sortedNums[i]
            }
        }
        return result + 1
    }
    
}
