//
//  main.swift
//  76-MinimumWindowSubstring
//
//  Created by Shvier on 07/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func minWindow(_ s: String, _ t: String) -> String {
        var map = [String: Int]()
        let tCharacters = [Character](t.characters)
        let sCharacters = [Character](s.characters)
        for character in tCharacters {
            map[String(character)] = 1
        }
        var counter = tCharacters.count
        var begin = 0
        var end = 0
        var d = Int.max
        var head = 0
        while end < sCharacters.count {
            if map[String(sCharacters[end])]! > 0 {
                counter -= 1
            }
            map[String(sCharacters[end])] = map[String(sCharacters[end])]! - 1
            end += 1
            while counter == 0 {
                if end - begin < d {
                    head = begin
                    d = end - head
                }
                if map[String(sCharacters[begin])] == 0 {
                    counter += 1
                }
                map[String(sCharacters[begin])] = map[String(sCharacters[begin])]! - 1
                begin += 1
            }
        }
        let startIndex = s.index(s.startIndex, offsetBy: head)
        let endIndex = s.index(startIndex, offsetBy: end)
        return d == Int.max ? "" : s.substring(with: startIndex..<endIndex)
    }
    
}
