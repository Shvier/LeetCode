//
//  main.swift
//  47-PermutationsII
//
//  Created by Shvier on 01/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result = Array<Array<Int>>()
        var temp = Array<Int>()
        var seen = Array(repeating: false, count: nums.count)
        backtrack(&result, nums.sorted(), &seen, &temp)
        return result
    }
    
    func backtrack(_ result: inout [[Int]], _ nums: [Int], _ seen: inout [Bool], _ temp: inout [Int]) {
        let count = nums.count
        if temp.count == count {
            result.append(temp)
        }
        for index in 0..<count {
            if index > 0 {
                if nums[index] == nums[index-1] && temp.count == 0 {
                    continue
                }
            }
            if !seen[index] {
                seen[index] = true
                temp.append(nums[index])
                backtrack(&result, nums, &seen, &temp)
                seen[index] = false
                temp.removeLast()
            }
        }
    }
    
}

let solution = Solution()
print(solution.permuteUnique([-1, 2, -1, 2, 1, -1, 2, 1]))
