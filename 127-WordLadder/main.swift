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
        if !wordList.contains(endWord) {
            return 0
        }
        var ans = Int.max
        var visited = [String: Bool]()
        var temp = [String]()
        var steps = [Int]()
        temp.append(beginWord)
        steps.append(1)
        let startingValue = Int(("a" as UnicodeScalar).value)
        while !temp.isEmpty {
            let currentWord = temp.popLast()!
            let currentStep = steps.popLast()!
            let countOfDiff = canTransform(currentWord, endWord)
            if countOfDiff < 2 {
                ans = min(countOfDiff + currentStep, ans)
            }
            var currentCharacters = [Character](currentWord.characters)
            for i in 0..<currentCharacters.count {
                let currentChar = currentCharacters[i]
                for j in 0..<26 {
                    let characterAtJ = Character(UnicodeScalar(j + startingValue)!)
                    if currentChar == characterAtJ {
                        continue
                    }
                    currentCharacters[i] = characterAtJ
                    let nextString = String(currentCharacters)
                    if wordList.contains(nextString) &&
                        ((visited.keys.contains(nextString) && !visited[nextString]!) || !visited.keys.contains(nextString)){
                        visited.updateValue(true, forKey: nextString)
                        temp.append(nextString)
                        steps.append(currentStep + 1)
                    }
                    currentCharacters[i] = currentChar
                }
            }
        }
        return ans == Int.max ? 0 : ans
    }
    
    func canTransform(_ string1: String, _ string2: String) -> Int {
        let characters1 = [Character](string1.characters)
        let characters2 = [Character](string2.characters)
        let count = characters1.count
        var countOfDifference = 0
        for index in 0..<count {
            if characters1[index] != characters2[index] {
                countOfDifference = countOfDifference + 1
            }
            if countOfDifference > 1 {
                break
            }
        }
        return countOfDifference
    }
    
}

let solution = Solution()
print(solution.ladderLength("qa", "sq", ["si","go","se","cm","so","ph","mt","db","mb","sb","kr","ln","tm","le","av","sm","ar","ci","ca","br","ti","ba","to","ra","fa","yo","ow","sn","ya","cr","po","fe","ho","ma","re","or","rn","au","ur","rh","sr","tc","lt","lo","as","fr","nb","yb","if","pb","ge","th","pm","rb","sh","co","ga","li","ha","hz","no","bi","di","hi","qa","pi","os","uh","wm","an","me","mo","na","la","st","er","sc","ne","mn","mi","am","ex","pt","io","be","fm","ta","tb","ni","mr","pa","he","lr","sq","ye"]))
