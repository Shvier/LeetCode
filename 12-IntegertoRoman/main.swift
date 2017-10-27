//
//  main.swift
//  12-IntegertoRoman
//
//  Created by Shvier on 27/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func intToRoman(_ num: Int) -> String {
        if num <= 10 {
            return Solution.unitMap(num)
        }
        var number = num
        var result = ""
        let step: Int = 10
        var numbers = Array<Int>()
        var bitIndex: Int = 0
        while number > 0 {
            let bit = number%step
            number = number/10
            numbers.append(bit)
            if bitIndex == 0 {
                result = Solution.unitMap(bit) + result
            } else if bitIndex == 1 {
                result = Solution.decadeMap(bit) + result
            } else if bitIndex == 2 {
                result = Solution.hundredMap(bit) + result
            } else if bitIndex == 3 {
                result = Solution.kiloMap(bit) + result
            }
            bitIndex += 1
        }
        return result
    }
    
    static func unitMap(_ num: Int) -> String {
        switch num {
        case 1:
            return "I"
        case 2:
            return "II"
        case 3:
            return "III"
        case 4:
            return "IV"
        case 5:
            return "V"
        case 6:
            return "VI"
        case 7:
            return "VII"
        case 8:
            return "VIII"
        case 9:
            return "IX"
        case 10:
            return "X"
        default:
            return ""
        }
    }
    
    static func decadeMap(_ num: Int) -> String {
        var string = ""
        if num < 4 {
            for _ in 0..<num {
                string += "X"
            }
        } else if num == 4 {
            string += "XL"
        } else if num > 4 && num < 9{
            string += "L"
            for _ in 5..<num {
                string += "X"
            }
        } else if num == 9 {
            string += "XC"
        }
        return string
    }
    
    static func hundredMap(_ num: Int) -> String {
        var string = ""
        if num < 4 {
            for _ in 0..<num {
                string += "C"
            }
        } else if num == 4 {
            string += "CD"
        } else if num > 4 && num < 9{
            string += "D"
            for _ in 5..<num {
                string += "C"
            }
        } else if num == 9 {
            string += "CM"
        }
        return string
    }
    
    static func kiloMap(_ num: Int) -> String {
        var string = ""
        for _ in 0..<num {
            string += "M"
        }
        return string
    }
    
}

print(Solution.intToRoman(1000))
