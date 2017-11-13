//
//  main.swift
//  16-3SumClosest
//
//  Created by Shvier on 04/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    // TLE
    static func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var offset: Int = 0
        var first: Bool = true
        let size = nums.count
        if size < 3 {
            return 0
        }
        let sortedNums = nums.sorted()
        for i in 0..<size-2 {
            if i > 0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }
            var left = i + 1
            var right = size - 1
            while left < right {
                let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                if first {
                    offset = target - sum
                    first = false
                } else {
                    if fabs(Double(offset)) > fabs(Double(target - sum)) {
                        offset = target - sum
                    }
                }
                if sum < target {
                    left += 1
                } else if sum > target {
                    right -= 1
                } else {
                    return target
                }
            }
        }
        return target - offset
    }
    
}

print(Solution.threeSumClosest([1,2,5,10,11], 12))
