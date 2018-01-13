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
        placeQueens(&ans, &matrix, 0)
        return ans
    }
    
    func placeQueens(_ ans: inout [[String]], _ matrix: inout [[String]], _ row: Int) {
        let count = matrix.count
        if row == count {
            var currentQueens = [String]()
            for strings in matrix {
                let string = strings.joined(separator: "")
                currentQueens.append(string)
            }
            ans.append(currentQueens)
            return
        }
        for col in 0..<count {
            if checkPositionValid(matrix, row, col, count) {
                matrix[row][col] = "Q"
                placeQueens(&ans, &matrix, row + 1)
                matrix[row][col] = "."
            }
        }
    }
    
    func checkPositionValid(_ queens: [[String]], _ row: Int, _ col: Int, _ max: Int) -> Bool {
        for index in 0..<row {
            if queens[index][col] == "Q" {
                return false
            }
        }
        var i = row - 1
        var j = col - 1
        while i >= 0 && j >= 0 {
            if queens[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        i = row - 1
        j = col + 1
        while i >= 0 && j < max {
            if queens[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        return true
    }
    
}

let solution = Solution()
print(solution.solveNQueens(8))
