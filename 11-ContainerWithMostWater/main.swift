//
//  main.swift
//  11-ContainerWithMostWater
//
//  Created by Shvier on 26/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea: Int = 0
        while left < right {
            maxArea = max(maxArea, min(height[left], height[right])*(right - left))
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }
    
}
