//
//  main.swift
//  36-ValidSudoku
//
//  Created by Shvier on 09/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var checkRow = Array(repeating: Array(repeatElement(false, count: 9)), count: 9)
        var checkCol = Array(repeating: Array(repeatElement(false, count: 9)), count: 9)
        var checkSub = Array(repeating: Array(repeatElement(false, count: 9)), count: 9)
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] != "." {
                    let num = Int(String(board[i][j]) - "0") - 1
                    let k = i/3*3+j/3
                    if checkRow[i][num] || checkCol[j][num] || checkSub[k][num] {
                        return false
                    }
                    checkRow[i][num] = checkCol[j][num] = checkSub[k][num] = true
                }
            }
        }
        return true
    }
    
}

