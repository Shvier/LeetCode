//
//  main.swift
//  85-MaximalRectangle
//
//  Created by Shvier on 24/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let row = matrix.count
        guard let colMatrix = matrix.first else { return 0 }
        let col = colMatrix.count
        var ans = 0
        var left = Array(repeating: 0, count: col)
        var right = Array(repeating: col, count: col)
        var height = Array(repeating: Array(repeatElement(0, count: col)), count: row)
        for i in 0..<row {
            var curLeft = 0
            var curRight = col
            for j in 0..<col {
                if matrix[i][j] == "1" {
                    if i == 0 {
                        height[i][j] = 1
                    } else {
                        height[i][j] = height[i-1][j] + 1
                    }
                } else {
                    height[i][j] = 0
                }
            }
            for j in 0..<col {
                if matrix[i][j] == "1" {
                    left[j] = max(left[j], curLeft)
                } else {
                    left[j] = 0
                    curLeft += 1
                }
            }
            for j in (0..<col).reversed() {
                if matrix[i][j] == "1" {
                    right[j] = min(right[j], curRight)
                } else {
                    right[j] = col
                    curRight = j
                }
            }
            for j in 0..<col {
                ans = max(ans, (right[j]-left[j])*height[i][j])
            }
        }
        return ans
    }
    
}

let solution = Solution()
print(solution.maximalRectangle([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]))
