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
                if i == 0 {
                    offset = target - sum
                } else {
                    if target > 0 {
                        if offset > target - sum {
                            offset = target - sum
                        }
                    } else {
                        if offset < target - sum {
                            offset = target - sum
                        }
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

print(Solution.threeSumClosest([0, 2, 1, -3], 1))
