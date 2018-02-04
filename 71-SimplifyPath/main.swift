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
        var tmp = [String]()
        let subPaths = path.components(separatedBy: "/")
        for subPath in subPaths {
            if subPath == "" || subPath == "." {
                continue
            }
            if subPath == ".." && tmp.count > 0 {
                tmp.removeLast()
            } else if subPath != ".." {
                tmp.append(subPath)
            }
        }
        for tmpString in tmp {
            ans += "/" + tmpString
        }
        if ans.lengthOfBytes(using: .utf8) <= 0 {
            return "/"
        }
        return ans
    }
    
}

let solution = Solution()
print(solution.simplifyPath("/abc/..."))
