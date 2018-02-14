//
//  main.swift
//  77-Combinations
//
//  Created by Shvier on 13/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]]()
        if k > n {
            return ans
        }
        var temp = [Int]()
        subCombine(1, n, k, &temp, &ans)
        ans.removeLast()
        return ans
    }
    
    func subCombine(_ start: Int, _ max: Int, _ count: Int, _ temp: inout [Int], _ ans: inout [[Int]]) {
        if count == temp.count {
            ans.append(temp)
            return
        }
        for i in start...max {
            temp.append(i)
            subCombine(i, max, count, &temp, &ans)
            temp.removeLast()
        }
    }
    
}

let solution = Solution()
print(solution.combine(6, 0))
