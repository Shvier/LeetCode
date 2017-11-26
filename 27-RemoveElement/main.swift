//
//  main.swift
//  27-RemoveElement
//
//  Created by Shvier on 26/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count < 1 {
            return nums.count
        }
        nums.sort()
        var length = 0
        for i in 0..<nums.count {
            nums[length] = nums[i]
            if nums[i] != val {
                length += 1
            }
        }
        return length
    }
    
}
