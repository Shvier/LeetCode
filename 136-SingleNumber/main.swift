//
//  main.swift
//  136-SingleNumber
//
//  Created by Shvier on 2018/6/8.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func singleNumber(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        var ans = 0
        for num in nums {
            ans = ans ^ num
        }
        return ans
    }
    
}

let solution = Solution()
print(solution.singleNumber([4, 1, 2, 1, 2]))
