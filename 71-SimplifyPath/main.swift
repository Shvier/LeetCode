//
//  main.swift
//  71-SimplifyPath
//
//  Created by Shvier on 02/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func simplifyPath(_ path: String) -> String {
        var ans = ""
        let subPaths = path.components(separatedBy: "/")
        for subPath in subPaths.reversed() {
            if subPath.lengthOfBytes(using: .utf8) > 0 && subPath != "." && subPath != ".." {
                ans = "/\(subPath)"
            }
        }
        if ans.lengthOfBytes(using: .utf8) <= 0 {
            return "/"
        }
        return ans
    }
    
}

let solution = Solution()
print(solution.simplifyPath("/."))
