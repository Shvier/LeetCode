//
//  main.swift
//  79-WordSearch
//
//  Created by Shvier on 17/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let row = board.count
        guard let firstCol = board.first else { return false }
        let col = firstCol.count
        var matrix = board
        let characters = [Character](word.characters)
        for i in 0..<row {
            for j in 0..<col {
                if search(i, j, row, col, &matrix, 0, characters) {
                    return true
                }
            }
        }
        return false
    }
    
    func search(_ x: Int, _ y: Int, _ maxRow: Int, _ maxCol: Int, _ board: inout [[Character]], _ index: Int, _ characters: [Character]) -> Bool {
        if index == characters.count {
            return true
        }
        if x >= maxRow || y >= maxCol || x < 0 || y < 0 {
            return false
        }
        if board[x][y] == characters[index] {
            let temp = board[x][y]
            board[x][y] = "*"
            let ans = search(x, y-1, maxRow, maxCol, &board, index+1, characters) ||
                search(x-1, y, maxRow, maxCol, &board, index+1, characters) ||
                search(x, y+1, maxRow, maxCol, &board, index+1, characters) ||
                search(x+1, y, maxRow, maxCol, &board, index+1, characters)
            board[x][y] = temp
            return ans
        } else {
            return false
        }
    }
    
}

let solution = Solution()
print(solution.exist([["a"], ["a"]], "aaa"))
