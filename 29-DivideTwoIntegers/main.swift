//
//  main.swift
//  29-DivideTwoIntegers
//
//  Created by Shvier on 27/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    // TLE
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if divisor == 0 || Int32(dividend) == Int32.min && divisor == -1 {
            return Int(Int32.max)
        }
        var isDivisorNegative: Bool = false
        var fabsDivisor: Int32 = Int32(divisor)
        var isDividendNegative: Bool = false
        var fabsDividend: Int32 = Int32(dividend)
        if dividend < 0 {
            isDividendNegative = true
            fabsDividend = Int32(fabs(Double(dividend)))
        }
        if divisor < 0 {
            isDivisorNegative = true
            fabsDivisor = Int32(fabs(Double(divisor)))
        }
        var quotient: Int32 = 0
        while fabsDividend >= fabsDivisor {
            var temp = fabsDivisor
            var mutiple: Int32 = 1
            while fabsDividend >= (temp << 1) {
                temp <<= 1
                mutiple <<= 1
            }
            fabsDividend -= temp
            quotient += mutiple
        }
        if (isDivisorNegative && !isDividendNegative) || (!isDivisorNegative && isDividendNegative) {
            return Int(-quotient)
        } else {
            return Int(quotient)
        }
    }
    
}
