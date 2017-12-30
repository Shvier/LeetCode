//
//  main.swift
//  45-JumpGameII
//
//  Created by Shvier on 29/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func jump(_ nums: [Int]) -> Int {
        let count = nums.count
        if count < 2 {
            return 0
        }
        var currentMax = 0
        var nextMax = 0
        var index = 0
        var level = 0
        while currentMax >= index {
            level += 1
            for i in index...currentMax {
                nextMax = max(nextMax, nums[i]+i)
                if nextMax >= count-1 {
                    return level
                }
                index += 1
            }
            if currentMax == nextMax {
                return 0
            }
            currentMax = nextMax
        }
        return 0
    }
    
}
