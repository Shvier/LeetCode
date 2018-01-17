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
        placeNumber(&ans, matrix, 0, 0, matrix.count, (matrix.first?.count)!)
        return ans
    }
    
    func placeNumber(_ ans: inout [Int], _ matrix: [[Int]], _ x: Int, _ y: Int, _ m: Int, _ n: Int) {
        if x < 0 {

        }
        ans.append(matrix[x][y])
        if y == m-1-x {
            
        }
    }
    
}
