//
//  main.swift
//  54-SpiralMatrix
//
//  Created by Shvier on 17/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var ans = [Int]()
        let m = matrix.count
        let n = matrix.first?.count
        if m < 1 || (n != nil && n! < 1) {
            return ans
        }
        var rowBegin = 0
        var rowEnd = m-1
        var colBegin = 0
        var colEnd = n!-1
        while rowBegin <= rowEnd && colBegin <= colEnd {
            if colBegin <= colEnd {
                for y in colBegin...colEnd {
                    ans.append(matrix[rowBegin][y])
                }
            }
            rowBegin += 1
            
            if rowBegin <= rowEnd {
                for x in rowBegin...rowEnd {
                    ans.append(matrix[x][colEnd])
                }
            }
            colEnd -= 1
            
            if rowBegin <= rowEnd && colBegin <= colEnd {
                for y in (colBegin...colEnd).reversed() {
                    ans.append(matrix[rowEnd][y])
                }
            }
            rowEnd -= 1
            
            if colBegin <= colEnd && rowBegin <= rowEnd {
                for x in (rowBegin...rowEnd).reversed() {
                    ans.append(matrix[x][colBegin])
                }
            }
            colBegin += 1
        }
        return ans
    }
    
}
