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
        return ans
    }
    
    func subCombine(_ start: Int, _ max: Int, _ count: Int, _ temp: inout [Int], _ ans: inout [[Int]]) {
        if count == 0 {
            ans.append(temp)
            return
        }
        if start > max {
            return
        }
        for i in start...max {
            temp.append(i)
            subCombine(i+1, max, count-1, &temp, &ans)
            temp.removeLast()
        }
    }
    
}

let solution = Solution()
print(solution.combine(4, 2))
