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
        let sortedNums = nums.sorted()
        var ans = [[Int]]()
        ans.append([Int]())
        var count = 0
        var startIndex = 0
        for i in 0..<sortedNums.count {
            if i > 0 && sortedNums[i] == sortedNums[i-1] {
                startIndex = count
            } else {
                startIndex = 0
            }
            count = ans.count
            for j in startIndex..<count {
                var temp = ans[j]
                temp.append(sortedNums[i])
                ans.append(temp)
            }
        }
        return ans
    }
    
}

let solution = Solution()
print(solution.subsetsWithDup([1, 2, 2]))
