//
//  main.swift
//  78-Subsets
//
//  Created by Shvier on 17/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        if nums.count < 1 {
            return ans
        }
        var temp = [Int]()
        combinations(&ans, nums, &temp, 0)
        return ans
    }
    
    func combinations(_ ans: inout [[Int]], _ nums: [Int], _ temp: inout [Int], _ start: Int) {
        ans.append(temp)
        if start > nums.count {
            return
        }
        for i in start..<nums.count {
            temp.append(nums[i])
            combinations(&ans, nums, &temp, i+1)
            temp.removeLast()
        }
    }
    
}

let solution = Solution()
print(solution.subsets([1, 2, 3]))
