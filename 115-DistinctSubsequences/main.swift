//
//  main.swift
//  115-DistinctSubsequences
//
//  Created by Shvier on 2018/4/3.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    // TLE
//    func numDistinct(_ s: String, _ t: String) -> Int {
//        let sCharacters = [Character](s.characters)
//        let tCharacters = [Character](t.characters)
//        var ans = 0
//        var temp = [Character]()
//        search(&ans, &temp, sCharacters, tCharacters, t, 0)
//        return ans
//    }
//    
//    func search(_ ans: inout Int, _ temp: inout [Character], _ sCharacters: [Character], _ tCharacters: [Character], _ tString: String, _ index: Int) {
//        let tempString = String(temp)
//        if tempString == tString {
//            ans += 1
//            return
//        }
//        for i in index..<sCharacters.count {
//            temp.append(sCharacters[i])
//            search(&ans, &temp, sCharacters, tCharacters, tString, i+1)
//            temp.removeLast()
//        }
//    }
    
    func numDistinct(_ s: String, _ t: String) -> Int {
        let sCharacters = [Character](s.characters)
        let tCharacters = [Character](t.characters)
        if sCharacters.count < 1 && tCharacters.count < 1 {
            return 1
        }
        if sCharacters.count < 1 && tCharacters.count > 0 {
            return 0
        }
        if sCharacters.count > 0 && tCharacters.count < 1 {
            return 1
        }
        var dp = Array(repeating: Array(repeatElement(0, count: sCharacters.count+1)), count: tCharacters.count+1)
        dp[0][0] = 1
        for index in 1...sCharacters.count {
            dp[0][index] = 1
        }
        for index in 1...tCharacters.count {
            dp[index][0] = 0
        }
        for i in 1...tCharacters.count {
            for j in 1...sCharacters.count {
                dp[i][j] = dp[i][j-1]
                if sCharacters[j-1] == tCharacters[i-1] {
                    dp[i][j] += dp[i-1][j-1]
                }
            }
        }
        return dp[tCharacters.count][sCharacters.count]
    }
    
}

let solution = Solution()
print(solution.numDistinct("rabbbit", "rabbit"))
