//
//  main.swift
//  1-TwoSum
//
//  Created by Shvier on 11/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result: Array<Int> = Array<Int>()
    for i in 0..<nums.count {
        let num1 = nums[i]
        for j in i+1..<nums.count {
            let num2 = nums[j]
            if (num1 + num2) == target {
                result.append(i)
                result.append(j)
                return result
            }
        }
    }
    return result
}
