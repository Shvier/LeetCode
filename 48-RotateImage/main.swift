//
//  main.swift
//  48-RotateImage
//
//  Created by Shvier on 07/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func rotate(_ matrix: inout [[Int]]) {
        let count = matrix.count
        for index in 0..<count/2 {
            let temp = matrix[index]
            matrix[index] = matrix[count-index-1]
            matrix[count-index-1] = temp
        }
        for i in 0..<matrix.count {
            for j in i..<matrix[i].count {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
    }
    
}

let solution = Solution()
var matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
solution.rotate(&matrix)
