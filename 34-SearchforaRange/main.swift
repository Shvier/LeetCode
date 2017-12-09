//
//  main.swift
//  34-SearchforaRange
//
//  Created by Shvier on 08/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 1 {
            return [-1, -1]
        }
        var left = 0
        var right = nums.count-1
        var result = [-1, -1]
        while left <= right {
            if target > nums[left] {
                left += 1
            } else if target == nums[left] && result[0] == -1 {
                result[0] = left
            }
            if target < nums[right] {
                right -= 1
            } else if target == nums[right] && result[1] == -1 {
                result[1] = right
            }
            if result[0] != -1 && result[1] != -1 {
                break
            }
        }
        return result
    }
    
}

Solution.searchRange([5, 7, 7, 8, 8, 10], 8)
