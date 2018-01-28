//
//  main.swift
//  64-MinimumPathSum
//
//  Created by Shvier on 27/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let opN = grid.first?.count
        if m < 1 || opN == nil || opN! < 1 {
            return 0
        }
        let n = opN!
        var matrix = Array(repeating: Array(repeatElement(0, count: n)), count: m)
        matrix[0][0] = grid[0][0]
        for i in 1..<m {
            matrix[i][0] = grid[i][0] + matrix[i-1][0]
        }
        for j in 1..<n {
            matrix[0][j] = grid[0][j] + matrix[0][j-1]
        }
        for i in 1..<m {
            for j in 1..<n {
                matrix[i][j] = min(matrix[i-1][j], matrix[i][j-1]) + grid[i][j]
            }
        }
        return matrix[m-1][n-1]
    }
    
}
