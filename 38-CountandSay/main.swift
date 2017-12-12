//
//  main.swift
//  38-CountandSay
//
//  Created by Shvier on 12/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        var result = "1"
        for _ in 1..<n {
            result = generate(result)
        }
        return result
    }
    
    func generate(_ string: String) -> String {
        let length = string.lengthOfBytes(using: .utf8)
        if length == 1 {
            return "1" + string
        }
        var result = ""
        var count = 1
        let characters = [Character](string.characters)
        for i in 1..<length {
            if characters[i-1] == characters[i] {
                count += 1
            } else {
                result = result + "\(count)" + String(characters[i-1])
                count = 1
            }
            if i == length - 1 {
                result = result + "\(count)" + String(characters[i])
            }
        }
        return result
    }
    
}

let solution = Solution()
solution.countAndSay(4)

