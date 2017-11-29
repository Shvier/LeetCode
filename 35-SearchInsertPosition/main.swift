//
//  main.swift
//  35-SearchInsertPosition
//
//  Created by Shvier on 29/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 1 {
            return 0
        }
        var index = 0
        var offset = nums[0] - target
        for i in 0..<nums.count {
            let current = nums[i] - target
            if current >= 0 {
                if offset >= current {
                    offset = current
                    index = i
                }
            } else {
                index = i-1
                break
            }
        }
        return index
    }
    
}
