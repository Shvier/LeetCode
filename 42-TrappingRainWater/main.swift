//
//  main.swift
//  42-TrappingRainWater
//
//  Created by Shvier on 20/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func trap(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count-1
        var maxLeft = 0
        var maxRight = 0
        var result = 0
        while left <= right {
            maxLeft = max(maxLeft, height[left])
            maxRight = max(maxRight, height[right])
            if maxLeft < maxRight {
                result += maxLeft - height[left]
                left += 1
            } else {
                result += maxRight - height[right]
                right -= 1
            }
        }
        return result
    }
    
}
