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
            let characters = [Character](string.characters)
            let key = String(characters.sorted())
            if keyword[key] == nil {
                keyword.updateValue([string], forKey: key)
            } else {
                keyword[key]?.append(string)
            }
        }
        for key in keyword.keys {
            group.append(keyword[key]!)
        }
        return group
    }
    
}

let solution = Solution()
print(solution.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
