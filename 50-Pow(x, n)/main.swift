//
//  main.swift
//  50-Pow(x, n)
//
//  Created by Shvier on 09/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        var result: Double = 1
        var count = 0
        var number: Double = 0
        if n < 0 {
            count = Int(fabs(Double(n)))
            number = 1/x
        } else {
            count = n
            number = x
        }
        while count > 0 {
            if count&1 != 0 {
                result *= number
            }
            number *= number
            count >>= 1
        }
        return result
    }
    
}

let solution = Solution()
print(solution.myPow(2.00000, 10))
