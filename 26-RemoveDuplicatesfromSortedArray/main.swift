//
//  main.swift
//  26-RemoveDuplicatesfromSortedArray
//
//  Created by Shvier on 25/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        var length = 1
        for i in 1..<nums.count {
            if nums[i-1] != nums[i] {
                nums[length] = nums[i]
                length += 1
            }
        }
        return length
    }
    
}
