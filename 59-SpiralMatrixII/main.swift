//
//  main.swift
//  59-SpiralMatrixII
//
//  Created by Shvier on 22/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = Array(repeating: Array(repeatElement(0, count: n)), count: n)
        var rowBegin = 0
        var rowEnd = n-1
        var colBegin = 0
        var colEnd = n-1
        var increament = 1
        while rowBegin <= rowEnd && colBegin <= colEnd {
            if colBegin <= colEnd {
                for y in colBegin...colEnd {
                    matrix[rowBegin][y] = increament
                    increament += 1
                }
            }
            rowBegin += 1
            
            if rowBegin <= rowEnd {
                for x in rowBegin...rowEnd {
                    matrix[x][colEnd] = increament
                    increament += 1
                }
            }
            colEnd -= 1
            
            if rowBegin <= rowEnd && colBegin <= colEnd {
                for y in (colBegin...colEnd).reversed() {
                    matrix[rowEnd][y] = increament
                    increament += 1
                }
            }
            rowEnd -= 1
            
            if rowBegin <= rowEnd && colBegin <= colEnd {
                for x in (rowBegin...rowEnd).reversed() {
                    matrix[x][colBegin] = increament
                    increament += 1
                }
            }
            colBegin += 1
        }
        return matrix
    }
    
}
