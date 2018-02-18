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
        var boardMap = [Character: Int]()
        for charaters in board {
            for character in charaters {
                if boardMap[character] == nil {
                    boardMap[character] = 1
                } else {
                    boardMap[character] = boardMap[character]! + 1
                }
            }
        }
        let wordCharacters = [Character](word.characters)
        for character in wordCharacters {
            guard var boardCharacterCount = boardMap[character] else { return false }
            boardCharacterCount -= 1
            boardMap[character] = boardCharacterCount
            if boardCharacterCount < 0 {
                return false
            }
        }
        return true
    }
    
}

let solution = Solution()
print(solution.exist([["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]], "ABCCED"))
