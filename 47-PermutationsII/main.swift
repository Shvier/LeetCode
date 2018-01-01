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
        var tempResult = Array<String>()
        var temp = Array<Int>()
        var tempString = ""
        var seen = Array(repeating: false, count: nums.count)
        backtrack(&result, nums, &seen, &temp, &tempResult, &tempString)
        return result
    }
    
    func backtrack(_ result: inout [[Int]], _ nums: [Int], _ seen: inout [Bool], _ temp: inout [Int], _ tempResult: inout [String], _ tempString: inout String) {
        let count = nums.count
        if temp.count == count {
            if !tempResult.contains(tempString) {
                result.append(temp)
                tempResult.append(tempString)
            }
        }
        for index in 0..<count {
            if !seen[index] {
                seen[index] = true
                temp.append(nums[index])
                tempString = "\(tempString)\(nums[index])"
                backtrack(&result, nums, &seen, &temp, &tempResult, &tempString)
                seen[index] = false
                temp.removeLast()
                tempString = tempString.substring(to: tempString.index(before: tempString.endIndex))
            }
        }
    }
    
}

let solution = Solution()
print(solution.permuteUnique([-1, 2, -1, 2, 1, -1, 2, 1]))
