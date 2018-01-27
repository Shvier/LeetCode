//
//  main.swift
//  63-UniquePathsII
//
//  Created by Shvier on 25/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        let opN = obstacleGrid.first?.count
        if m < 1 || (opN != nil && opN! < 1) {
            return 0
        }
        let n = opN!
        var path = Array(repeating: Array(repeatElement(0, count: n)), count: m)
        for i in 0..<m {
            if obstacleGrid[i][0] == 1 {
                break
            }
            path[i][0] = 1
        }
        for j in 0..<n {
            if obstacleGrid[0][j] == 1 {
                break
            }
            path[0][j] = 1
        }
        for i in 1..<m {
            for j in 1..<n {
                if obstacleGrid[i][j] == 1 {
                    path[i][j] = 0
                } else {
                    path[i][j] = path[i-1][j] + path[i][j-1]
                }
            }
        }
        return path[m-1][n-1]
    }
    
}

let solution = Solution()
print(solution.uniquePathsWithObstacles([[1, 0]]))
