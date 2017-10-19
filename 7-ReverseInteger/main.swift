//
//  main.swift
//  7-ReverseInteger
//
//  Created by Shvier on 18/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    static func reverse(_ x: Int) -> Int {
        var result: Int = 0
        var numbers = Array<Int>()
        var step: Int = 10
        var temp = Int(fabs(Double(x)))
        while true {
            if temp >= step {
                numbers.append(temp%step)
            } else {
                numbers.append(temp)
                break
            }
            temp /= step
        }
        step = 1
        for _ in 0..<numbers.count - 1 {
            step *= 10
        }
        for number in numbers {
            result += number*step
            step /= 10
        }
        let max = Int(INT32_MAX)
        if x < 0 {
            if Int(fabs(Double(result))) > max {
                return 0
            }
            return 0-result
        } else {
            if result > max {
                return 0
            }
            return result
        }
    }
}

print(Solution.reverse(1534236469))
