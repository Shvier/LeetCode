//
//  main.swift
//  115-DistinctSubsequences
//
//  Created by Shvier on 2018/4/3.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func numDistinct(_ s: String, _ t: String) -> Int {
        let sCharacters = [Character](s.characters)
        let tCharacters = [Character](t.characters)
        var ans = 0
        var temp = [Character]()
        search(&ans, &temp, sCharacters, tCharacters, t, 0)
        return ans
    }
    
    func search(_ ans: inout Int, _ temp: inout [Character], _ sCharacters: [Character], _ tCharacters: [Character], _ tString: String, _ index: Int) {
        let tempString = String(temp)
        if tempString == tString {
            ans += 1
            return
        }
        for i in index..<sCharacters.count {
            temp.append(sCharacters[i])
            search(&ans, &temp, sCharacters, tCharacters, tString, i+1)
            temp.removeLast()
        }
    }
    
}

let solution = Solution()
print(solution.numDistinct("anacondastreetracecar", "contra"))
