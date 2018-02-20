//
//  main.swift
//  80-RemoveDuplicatesfromSortedArrayII
//
//  Created by Shvier on 19/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var ans = 0
        var newNums = [Int]()
        for index in 0..<nums.count {
            if index - 2 >= 0 {
                if nums[index-2] == nums[index] {
                    continue
                }
            }
            ans += 1
            newNums.append(nums[index])
        }
        nums = newNums
        return ans
    }
    
}

let solution = Solution()
var nums = [1, 1, 1, 2]
print(solution.removeDuplicates(&nums))
