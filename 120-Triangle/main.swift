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
        var dp = Array(repeating: 0, count: row+1)
        for i in (0..<row).reversed() {
            for j in 0..<triangle[i].count {
                dp[j] = triangle[i][j] + min(dp[j], dp[j+1])
            }
        }
        return dp[0]
    }
    
}

let solution = Solution()
print(solution.minimumTotal([[-1],[2,3],[1,-1,-3]]))
