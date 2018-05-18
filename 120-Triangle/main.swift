//
//  main.swift
//  120-Triangle
//
//  Created by Shvier on 2018/5/18.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let row = triangle.count
        if row < 1 {
            return 0
        }
        var dp = Array(repeating: 0, count: row)
        dp[0] = triangle[0][0]
        for i in 1..<row {
            for j in 0..<triangle[i].count {
                if j == 0 {
                    dp[i] = triangle[i][j] + dp[i-1]
                } else {
                    dp[i] = min(dp[i], triangle[i][j]+dp[i-1], triangle[i][j-1]+dp[i-1])
                }
            }
        }
        return dp[row-1]
    }
    
}

let solution = Solution()
print(solution.minimumTotal([[-1],[2,3],[1,-1,-3]]))
