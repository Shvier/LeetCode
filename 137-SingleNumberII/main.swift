//
//  main.swift
//  137-SingleNumberII
//
//  Created by Shvier on 2018/6/8.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func singleNumber(_ nums: [Int]) -> Int {
        var visited = Set<Int>()
        var valid = Set<Int>()
        for num in nums {
            if valid.contains(num) {
                continue
            }
            if visited.contains(num) {
                valid.insert(num)
                visited.remove(num)
            } else {
                visited.insert(num)
            }
        }
        return visited.first!
    }
    
}

let solution = Solution()
print(solution.singleNumber([0, 1, 0, 1, 0, 1, 99]))
