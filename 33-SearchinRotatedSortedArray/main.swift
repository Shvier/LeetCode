//
//  main.swift
//  33-SearchinRotatedSortedArray
//
//  Created by Shvier on 08/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        return search(nums, 0, nums.count-1, target)
    }
    
    func search(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
        if start > end {
            return -1;
        }
        let mid = start + (end - start)/2
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

