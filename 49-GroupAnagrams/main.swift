//
//  main.swift
//  49-GroupAnagrams
//
//  Created by Shvier on 08/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var group = Array<Array<String>>()
        var keyword = Dictionary<String, Array<String>>()
        for string in strs {
            let strings = string.components(separatedBy: "")
            let key = strings.sorted().joined(separator: "")
            var array = keyword[key]
            if array == nil {
                array = Array<String>()
            }
            array?.append(string)
        }
        for key in keyword.keys {
            group.append(keyword[key]!)
        }
        return group
    }
    
}

let solution = Solution()
print(solution.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
