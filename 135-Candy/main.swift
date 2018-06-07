//
//  main.swift
//  135-Candy
//
//  Created by Shvier on 2018/6/5.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func candy(_ ratings: [Int]) -> Int {
        let count = ratings.count
        if count <= 1 {
            return count
        }
        var counts = Array(repeating: 1, count: count)
        for index in 1..<count {
            if ratings[index] > ratings[index - 1] {
                counts[index] = counts[index - 1] + 1
            }
        }
        for index in (1..<count).reversed() {
            if ratings[index - 1] > ratings[index] {
                counts[index - 1] = max(counts[index] + 1, counts[index - 1])
            }
        }
        var ans = 0
        for index in 0..<count {
            ans = ans + counts[index]
        }
        return ans
    }
    
}
