//
//  main.swift
//  127-WordLadder
//
//  Created by Shvier on 2018/5/26.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if beginWord == endWord {
            return 1
        }
        var dict = Set<String>()
        for word in wordList {
            dict.insert(word)
        }
        var visited = Set<String>()
        var list = [String]()
        visited.insert(beginWord)
        list.append(beginWord)
        var length = 1
        while !list.isEmpty {
            length = length + 1
            let count = list.count
            print("length: \(length) - count: \(count)")
            for _ in 0..<count {
                let word = list.removeFirst()
                let nextWords = getNextWords(word, dict)
                print("word: \(word)\nnextWords: \(nextWords)")
                for nextWord in nextWords {
                    if visited.contains(nextWord) {
                        continue
                    }
                    if nextWord == endWord {
                        return length
                    }
                    visited.insert(nextWord)
                    list.append(nextWord)
                }
            }
        }
        return 0
    }
    
    func getNextWords(_ word: String, _ dict: Set<String>) -> [String] {
        var nextWords = [String]()
        let startingLetter = Int(("a" as UnicodeScalar).value)
        var characters = [Character](word.characters)
        for i in 0..<characters.count {
            let currentChar = characters[i]
            for j in 0..<26 {
                let letter = Character(UnicodeScalar(j + startingLetter)!)
                if currentChar == letter {
                    continue
                }
                characters[i] = letter
                let nextString = String(characters)
                if dict.contains(nextString) {
                    nextWords.append(nextString)
                }
                characters[i] = currentChar
            }
        }
        return nextWords
    }
    
}

let solution = Solution()
print(solution.ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
