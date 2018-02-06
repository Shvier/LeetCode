//
//  main.swift
//  74-Searcha2DMatrix
//
//  Created by Shvier on 06/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        guard let subMatrix = matrix.first else {
            return false
        }
        let n = subMatrix.count
        if m < 1 || n < 1 {
            return false
        }
        var left = 0
        var right = m*n - 1
        while left != right {
            let mid = (left + right - 1) >> 1
            if matrix[mid/n][mid%n] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return matrix[right/n][right%n] == target;
    }
    
}

let solution = Solution()
print(solution.searchMatrix([[1, 3, 5]], 2))
