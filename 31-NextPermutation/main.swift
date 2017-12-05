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
        var breakIndex = Int.min
        var startIndex = 0
        for i in (0..<nums.count).reversed() {
            for j in (0..<i).reversed() {
                if nums[i] <= nums[j] {
                    continue
                } else {
                    startIndex = i
                    breakIndex = breakIndex < j ? j : breakIndex
                }
            }
        }
        swap(&nums, start: startIndex, end: breakIndex)
        let start = breakIndex + 1
        let end = nums.count-1
        if start > end {
            return
        }
        for _ in start..<end {
            for l in start..<end {
                if nums[l] > nums[l+1] {
                    swap(&nums, start: l, end: l+1)
                }
            }
        }
        return
    }
    
    func swap(_ nums: inout [Int], start: Int, end: Int) {
        var temp = 0
        temp = nums[start]
        nums[start] = nums[end]
        nums[end] = temp
    }
    
}

let solution = Solution()
var array = [1, 2, 3]
solution.nextPermutation(&array)
