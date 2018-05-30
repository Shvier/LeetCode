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
        var dict = Set<String>()
        for word in wordList {
            dict.insert(word)
        }
        var current = [String]()
        current.append(beginWord)
        var paths = [[String]]()
        paths.append(current)
        var level = 1
        var minLevel = Int.max
        var words = Set<String>()
        let startingLetter = Int(("a" as UnicodeScalar).value)
        while !paths.isEmpty {
            let tmp = paths.removeFirst()
            if tmp.count > level {
                for word in words {
                    dict.remove(word)
                }
                words.removeAll()
                level = tmp.count
                if level > minLevel {
                    break
                }
            }
            var last = tmp.last!
            var characters = [Character](last.characters)
            for i in 0..<characters.count {
                let currentChar = characters[i]
                for j in 0..<26 {
                    let letter = Character(UnicodeScalar(j + startingLetter)!)
                    characters[i] = letter
                    let nextString = String(characters)
                    if !dict.contains(nextString) {
                        characters[i] = currentChar
                        continue
                    }
                    words.insert(nextString)
                    var newTemp = [String]()
                    for string in tmp {
                        newTemp.append(string)
                    }
                    newTemp.append(nextString)
                    if nextString == endWord {
                        ans.append(newTemp)
                        minLevel = level
                    } else {
                        paths.append(newTemp)
                    }
                    characters[i] = currentChar
                }
            }
        }
        return ans
    }
    
}

let solution = Solution()
print(solution.findLadders("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
