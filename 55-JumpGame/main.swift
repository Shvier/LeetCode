//
//  main.swift
//  55-JumpGame
//
//  Created by Shvier on 19/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func canJump(_ nums: [Int]) -> Bool {
        let count = nums.count
        var step = 0
        var reach = 0
        while step < count && step <= reach {
            reach = max(nums[step] + step, reach)
            step += 1
        }
        return step == count
    }
    
}
