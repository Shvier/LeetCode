//
//  main.swift
//  81-SearchinRotatedSortedArrayII
//
//  Created by Shvier on 20/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func search(_ nums: [Int], _ target: Int) -> Bool {
        if nums.count < 1 {
            return false
        }
        var left = 0
        var right = nums.count - 1
        var mid = 0
        while left < right {
            mid = (left + right)/2
            if nums[mid] == target {
                return true
            }
            if nums[mid] > nums[right] {
                if nums[mid] > target && nums[left] <= target {
                    right = mid
                } else {
                    left = mid + 1
                }
            } else if nums[mid] < nums[right] {
                if nums[mid] < target && nums[right] >= target {
                    left = mid + 1
                } else {
                    right = mid
                }
            } else {
                right -= 1
            }
        }
        return nums[left] == target
    }
    
}

let solution = Solution()
print(solution.search([3, 1, 1], 3))
