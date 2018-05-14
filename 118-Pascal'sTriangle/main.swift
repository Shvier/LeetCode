//
//  main.swift
//  118-Pascal'sTriangle
//
//  Created by Shvier on 2018/5/14.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func generate(_ numRows: Int) -> [[Int]] {
        var ans = Array(repeating: [Int](), count: numRows)
        if numRows < 3 {
            for i in 0..<numRows {
                for _ in 0...i {
                    ans[i].append(1)
                }
            }
            return ans
        }
        for i in 0..<2 {
            for _ in 0...i {
                ans[i].append(1)
            }
        }
        for i in 2..<numRows {
            for j in 0...i {
                if j == 0 || j == i {
                    ans[i].append(1)
                } else {
                    ans[i].append(ans[i-1][j-1]+ans[i-1][j])
                }
            }
        }
        return ans
    }
    
}

let solution = Solution()
print(solution.generate(5))
