//
//  main.swift
//  130-SurroundedRegions
//
//  Created by Shvier on 2018/5/30.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func solve(_ board: inout [[Character]]) {
        if board.isEmpty {
            return
        }
        let rows = board.count
        let cols = board[0].count
        for index in 0..<rows {
            detect(&board, index, 0, rows, cols)
            detect(&board, index, cols-1, rows, cols)
        }
        for index in 0..<cols {
            detect(&board, 0, index, rows, cols)
            detect(&board, rows-1, index, rows, cols)
        }
        for x in 0..<rows {
            for y in 0..<cols {
                if board[x][y] == "O" {
                    board[x][y] = "X"
                } else if board[x][y] == "1" {
                    board[x][y] = "O"
                }
            }
        }
    }
    
    func detect(_ board: inout [[Character]], _ x: Int, _ y: Int, _ rows: Int, _ cols: Int) {
        if board[x][y] == "O" {
            board[x][y] = "1"
            if x > 1 {
                detect(&board, x - 1, y, rows, cols)
            }
            if y > 1 {
                detect(&board, x, y - 1, rows, cols)
            }
            if x < rows - 1 {
                detect(&board, x + 1, y, rows, cols)
            }
            if y < cols - 1 {
                detect(&board, x, y + 1, rows, cols)
            }
        }
    }
    
}
