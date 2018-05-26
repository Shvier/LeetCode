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
        var temp = [String]()
        if wordList.contains(endWord) {
            temp.append(beginWord)
            match(beginWord, endWord, wordList, &ans, &temp)
        }
        return ans
    }
    
    func match(_ beginWord: String, _ endWord: String, _ wordList: [String], _ ans: inout [[String]], _ temp: inout [String]) {
        if canTransform(beginWord, endWord) {
            if temp.count > 0 && temp.count == endWord.lengthOfBytes(using: .utf8) + 1 {
                temp.append(endWord)
                ans.append(temp)
                temp.removeLast()
            }
            return
        }
        for i in 0..<wordList.count {
            if !canTransform(beginWord, wordList[i]) || temp.contains(wordList[i]) {
                continue
            }
            temp.append(wordList[i])
            match(wordList[i], endWord, wordList, &ans, &temp)
            temp.removeLast()
        }
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
    
}

let solution = Solution()
print(solution.findLadders("a", "c", ["a", "b", "c"]))
