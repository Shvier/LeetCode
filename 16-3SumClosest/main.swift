//
//  main.swift
//  16-3SumClosest
//
//  Created by Shvier on 04/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    // TLE
    static func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var sums = Array<Int>()
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                for k in j+1..<nums.count {
                    let sum = nums[i] + nums[j] + nums[k]
                    sums.append(sum)
                }
            }
        }
        var result: Int = 0
        var offset: Int = 0
        for i in 0..<sums.count {
            let sum = sums[i]
            if i == 0 {
                result = sum
                offset = abs(sum - target)
            } else if offset > abs(sum - target) {
                offset = abs(sum - target)
                result = sum
            }
        }
        return result
    }
    
}

print(Solution.threeSumClosest([88,54,99,11,-2,73,2,-4,62,58,80,48,25,49,93,-63,-48,-94,66,-65,-83,95,-5,-2,-62,58,-92,55,-62,-44,-68,-100,-56,61,-96,89,-97,-63,49,-34,25,-84,30,99,9,11,82,93,35,91,78,-8,-29,-41,-35,-20,33,-76,-42,-55,-49,95,43,-100,38,-75,-2,90,-86,-75,-72,47,98,-68,30,-23,20,76,-36,74,98,91,63,97,43,1,-98,52,-38,68,74,-12,41,23,96,17,-10,92,-20,54,-92,77,36,-50,14,-7,41,83,40,24,69,61,15,-51,5,-98,-92,-18,-69,68,-18,-38,62,6,58,-3,72,4,-48,55,-25,83,-26,10,-34,-44,-54,43,34,83,80,51,15,71,76,83,78,84,-98,-31,-38,16,-90,-39,75,-82,-7,37,-20,18,0,63,-98,-14,-73,-59,52,-35,-100,31,-96,-94,78,-25,-5,-61,10,49,-69,-35,40,-17,-34,-100,-93,-7,9,90,-98,17,-58,40,-34,74,85,9,-34,-84,11,-68,80,23,-7,7,-94,40,-35,-51,2,3,-66,-78,-38,-34,-77,85], -182))
