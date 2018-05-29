//
//  main.swift
//  128-LongestConsecutiveSequence
//
//  Created by Shvier on 2018/5/28.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        var ans = 1
        var numsSet = Set<Int>()
        for num in nums {
            numsSet.insert(num)
        }
        for num in nums {
            if numsSet.contains(num) {
                var currentNum = num
                var sum = 1
                while numsSet.remove(currentNum - 1) != nil {
                    currentNum = currentNum - 1
                }
                sum = sum + num - currentNum
                
                currentNum = num
                while numsSet.remove(currentNum + 1) != nil {
                    currentNum = currentNum + 1
                }
                sum = sum + currentNum - num
                ans = max(ans, sum)
            }
        }
        return ans
    }
    
}

let solution = Solution()
print(solution.longestConsecutive([0, -1]))
