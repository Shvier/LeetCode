//
//  main.swift
//  51-N-Queens
//
//  Created by Shvier on 10/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func solveNQueens(_ n: Int) -> [[String]] {
        var ans = Array<Array<String>>()
        var matrix = Array(repeating: Array(repeatElement(".", count: n)), count: n)
        var validPosition = [(x: Int, y: Int)]()
        placeQueens(&ans, &matrix, &validPosition)
        return ans
    }
    
    func placeQueens(_ ans: inout [[String]], _ matrix: inout [[String]], _ validPosition: inout [(x: Int, y: Int)]) {
        for x in 0..<matrix.count {
            for y in 0..<matrix.count {
                if !checkPositionValid(validPosition, (x, y)) || matrix[x][y] == "Q" {
                    continue
                }
                validPosition.append((x, y))
                matrix[x][y] = "Q"
                placeQueens(&ans, &matrix, &validPosition)
                validPosition.removeLast()
            }
        }
    }
    
    func checkPositionValid(_ position: [(x: Int, y: Int)], _ ord: (x: Int, y: Int)) -> Bool {
        for pos in position {
            if pos.x == ord.x && pos.y == ord.y {
                return false
            }
        }
        return true
    }
    
}
