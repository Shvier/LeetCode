//
//  main.swift
//  73-SetMatrixZeroes
//
//  Created by Shvier on 04/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func setZeroes(_ matrix: inout [[Int]]) {
        var col0 = 1
        let row = matrix.count
        guard let subMatrix = matrix.first else {
            return
        }
        let col = subMatrix.count
        for i in 0..<row {
            if matrix[i][0] == 0 {
                col0 = 0
            }
            for j in 1..<col {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in (0..<row).reversed() {
            for j in (1..<col).reversed() {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
            if col0 == 0 {
                matrix[i][0] = 0
            }
        }
    }
    
}
