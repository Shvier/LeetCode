//
//  main.swift
//  70-ClimbingStairs
//
//  Created by Shvier on 02/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func climbStairs(_ n: Int) -> Int {
        var steps = [Int]()
        steps.append(0)
        steps.append(1)
        steps.append(2)
        if n <= 2 {
            return steps[n]
        } else {
            for index in 3...n {
                steps.append(steps[index-1] + steps[index-2])
            }
        }
        return steps.last!
    }
    
}
