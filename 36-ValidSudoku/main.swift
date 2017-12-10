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
        var isValid = true
        for characters in board {
            isValid = isValid && checkSubBoard(board: characters)
        }
        return isValid
    }
    
    func checkSubBoard(board: [Character]) -> Bool {
        var checkArray = Array<Character>()
        for character in board {
            if !checkArray.contains(character) {
                checkArray.append(character)
            } else {
                return false
            }
        }
        return true
    }
    
}

