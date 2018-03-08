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
        ans.append(temp)
        let count = nums.count
        for index in 0..<count {
            if index > 0 && nums[index] == nums[index-1] {
                continue
            }
            temp.removeAll()
            subset(&ans, nums, &temp, index, index+1, count)
        }
        return ans
    }
    
    func subset(_ ans: inout [[Int]], _ nums: [Int], _ temp: inout [Int], _ start: Int, _ current: Int, _ max: Int) {
        temp.append(nums[start])
        ans.append(temp)
        for i in current..<max {
            for j in i..<max {
                temp.append(nums[j])
                ans.append(temp)
            }
            temp.removeAll()
            temp.append(nums[start])
        }
    }
    
}

let solution = Solution()
print(solution.subsetsWithDup([1, 2, 2]))
