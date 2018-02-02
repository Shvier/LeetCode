//
//  main.swift
//  69-Sqrt(x)
//
//  Created by Shvier on 02/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func mySqrt(_ x: Int) -> Int {
        if x == 0 || x == 1 {
            return x
        }
        var ans = 0
        var left = 0
        var right = x
        while left != right && left != right-1 {
            let tmp = (left+right)/2
            let sqTmp = tmp*tmp
            if sqTmp == x {
                ans = tmp
                return ans
            } else if sqTmp > x {
                right = tmp
            } else if sqTmp < x {
                left = tmp
            }
        }
        ans = left
        return ans
    }
    
}

let solution = Solution()
print(solution.mySqrt(8))
