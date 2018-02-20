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
        let index = search(nums, 0, nums.count-1, target)
        if index < 0 || index >= nums.count {
            return false
        }
        return nums[index] == target
    }
    
    func search(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
        if start > end {
            return -1
        }
        let mid = (start+end)/2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < nums[end] {
            if target > nums[mid] && target <= nums[end] {
                return search(nums, mid+1, end, target)
            } else {
                return search(nums, start, mid-1, target)
            }
        } else {
            if target >= nums[start] && target < nums[mid] {
                return search(nums, start, mid-1, target)
            } else {
                return search(nums, mid+1, end, target)
            }
        }
    }
    
}

let solution = Solution()
print(solution.search([3, 1, 1], 3))
