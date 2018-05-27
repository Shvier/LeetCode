//
//  main.swift
//  126-WordLadderII
//
//  Created by Shvier on 2018/5/25.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var ans = [[String]]()
        return ans
    }
    
    func canTransform(_ string1: String, _ string2: String) -> Bool {
        let characters1 = [Character](string1.characters)
        let characters2 = [Character](string2.characters)
        let count = characters1.count
        var countOfDifference = 0
        for index in 0..<count {
            if characters1[index] == characters2[index] {
                countOfDifference = countOfDifference + 1
            }
        }
        return countOfDifference == count-1
    }
    
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
        var ladder = [[String: [String]]]()
        var minStep = Int.max
        while !list.isEmpty {
            length = length + 1
            let count = list.count
            print("length: \(length) - count: \(count)")
            for _ in 0..<count {
                let word = list.removeFirst()
                let nextWords = getNextWords(word, dict)
                print("word: \(word)\nnextWords: \(nextWords)")
                var tempDict = [String: [String]]()
                tempDict.updateValue(nextWords, forKey: word)
                ladder.append(tempDict)
                for nextWord in nextWords {
                    if visited.contains(nextWord) {
                        continue
                    }
                    if nextWord == endWord && length <= minStep {
                        minStep = length
//                        return length
                    }
                    visited.insert(nextWord)
                    list.append(nextWord)
                }
            }
        }
        print(ladder)
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
