//
//  main.swift
//  46-Permutations
//
//  Created by Shvier on 31/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = Array<Array<Int>>()
        var temp = Array<Int>()
        var seen = Array(repeating: false, count: nums.count)
        backtrack(&result, nums, &seen, &temp)
        return result
    }
    
    func backtrack(_ result: inout [[Int]], _ nums: [Int], _ seen: inout [Bool], _ temp: inout [Int]) {
        let count = nums.count
        if temp.count == count {
            result.append(temp)
        }
        for index in 0..<count {
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
print(solution.permute([1, 2, 3]))
