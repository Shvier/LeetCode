//
//  main.swift
//  90-SubsetsII
//
//  Created by Shvier on 08/03/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var temp = [Int]()
        subset(&ans, nums, &temp, 0, nums.count)
        return ans
    }
    
    func subset(_ ans: inout [[Int]], _ nums: [Int], _ temp: inout [Int], _ current: Int, _ max: Int) {
        ans.append(temp)
        if current >= max {
            return
        }
        for index in current..<max {
            temp.append(nums[index])
            subset(&ans, nums, &temp, index+1, max)
            temp.removeLast()
        }
    }
    
}

let solution = Solution()
print(solution.subsetsWithDup([1, 2, 2]))
