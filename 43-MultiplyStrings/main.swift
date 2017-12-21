//
//  main.swift
//  43-MultiplyStrings
//
//  Created by Shvier on 20/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1.lengthOfBytes(using: .utf8) < 1 {
            return num2
        }
        if num2.lengthOfBytes(using: .utf8) < 1 {
            return num1
        }
        var characters1 = [Character](num1.characters)
        var characters2 = [Character](num2.characters)
        if characters1.count > characters2.count {
            let temp = characters1
            characters1 = characters2
            characters2 = temp
        }
        var result = ""
        var carry = 0
        for index in (0..<characters1.count).reversed() {
            let number1 = Int.init(String(characters1[index]))!
            let number2 = Int.init(String(characters2[index]))!
            var temp = number1*number2
            temp += carry
            if temp >= 10 {
                carry = temp/10
                temp = temp%10
            } else {
                carry = 0
            }
            result = "\(temp)\(result)"
        }
        if carry > 0 {
            result = "\(carry)\(result)"
        }
        return result
    }
    
}
