//
//  main.swift
//  52-N-QueensII
//
//  Created by Shvier on 14/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func totalNQueens(_ n: Int) -> Int {
        var queens = Array(repeating: Array(repeatElement(".", count: n)), count: n)
        var ans = 0
        placeQueens(&ans, &queens, 0)
        return ans
    }
    
    func placeQueens(_ ans: inout Int, _ queens: inout [[String]], _ row: Int) {
        let max = queens.count
        if row == max {
            ans += 1
            return
        }
        for col in 0..<max {
            if checkQueensValid(&queens, row, col, max) {
                queens[row][col] = "Q"
                placeQueens(&ans, &queens, row+1)
                queens[row][col] = "."
            }
        }
    }
    
    func checkQueensValid(_ queens: inout [[String]], _ row: Int, _ col: Int, _ max: Int) -> Bool {
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
