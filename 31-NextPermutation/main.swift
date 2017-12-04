//
//  main.swift
//  31-NextPermutation
//
//  Created by Shvier on 02/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }
        for i in 0..<nums.count-1 {
            if nums[i] < nums[i+1] {
                break
            }
            if i+1 == nums.count-1 {
                nums.sort()
                return
            }
        }
        for i in (0..<nums.count).reversed() {
            for j in (0..<i).reversed() {
                if nums[i] <= nums[j] {
                    continue
                } else {
                    swap(&nums, start: i, end: j)
                    let start = j + 1
                    let end = nums.count-1
                    if start > end {
                        return
                    }
                    for k in start..<end {
                        if nums[k] > nums[k+1] {
                            swap(&nums, start: k, end: k+1)
                        }
                    }
                    return
                }
            }
        }
    }
    
    func swap(_ nums: inout [Int], start: Int, end: Int) {
        var temp = 0
        temp = nums[start]
        nums[start] = nums[end]
        nums[end] = temp
    }
    
}

let solution = Solution()
var array = [1, 5, 1]
solution.nextPermutation(&array)
