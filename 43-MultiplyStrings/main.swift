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
        let num1Length = num1.lengthOfBytes(using: .utf8)
        let num2Length = num2.lengthOfBytes(using: .utf8)
        let characters1 = [Character](num1.characters)
        let characters2 = [Character](num2.characters)
        var pos = Array<Int>(repeatElement(0, count: num1Length+num2Length))
        for i in (0..<num1Length).reversed() {
            for j in (0..<num2Length).reversed() {
                let number1 = Int.init(String(characters1[i]))!
                let number2 = Int.init(String(characters2[j]))!
                let mul = number1*number2
                let p1 = i + j
                let p2 = i + j + 1
                let sum = mul + pos[p2]
                pos[p1] += sum / 10
                pos[p2] = sum % 10
            }
        }
        var result = ""
        for number in pos {
            if !(result.lengthOfBytes(using: .utf8) == 0 && number == 0) {
                result = "\(result)\(number)"
            }
        }
        return result.lengthOfBytes(using: .utf8) == 0 ? "0" : result
    }
    
}
