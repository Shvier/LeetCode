//
//  main.swift
//  22-GenerateParentheses
//
//  Created by Shvier on 20/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func generateParenthesis(_ n: Int) -> [String] {
        var result = Array<String>()
        Solution.backTrack(list: &result, string: "", open: 0, close: 0, max: n)
        return result
    }
    
    static func backTrack( list: inout Array<String>, string: String, open: Int, close: Int, max: Int) {
        if string.lengthOfBytes(using: .utf8) == max*2 {
            list.append(string)
            return
        }
        if open < max {
            backTrack(list: &list, string: string+"(", open: open+1, close: close, max: max)
        }
        if close < open {
            backTrack(list: &list, string: string+")", open: open, close: close+1, max: max)
        }
    }

}
