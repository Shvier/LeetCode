//
//  main.swift
//  53-MaximumSubarray
//
//  Created by Shvier on 16/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func maxSubArray(_ nums: [Int]) -> Int {
        var max = Int.min
        var sum = 0
        for index in 0..<nums.count {
            sum = nums[index] + (sum < 0 ? 0 : sum)
            max = sum > max ? sum : max
        }
        return max
    }
    
}
