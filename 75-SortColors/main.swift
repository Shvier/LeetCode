//
//  main.swift
//  75-SortColors
//
//  Created by Shvier on 07/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func sortColors(_ nums: inout [Int]) {
        var secondPoint = nums.count-1
        var zeroPoint = 0
        for i in 0...secondPoint {
            while nums[i] == 2 && i < secondPoint {
                let temp = nums[i]
                nums[i] = nums[secondPoint]
                nums[secondPoint] = temp
                secondPoint -= 1
            }
            while nums[i] == 0 && i > zeroPoint {
                let temp = nums[i]
                nums[i] = nums[zeroPoint]
                nums[zeroPoint] = temp
                zeroPoint += 1
            }
        }
    }
    
}
