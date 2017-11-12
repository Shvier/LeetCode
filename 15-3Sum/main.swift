//
//  main.swift
//  15-3Sum
//
//  Created by Shvier on 02/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = Array<Array<Int>>()
        let size = nums.count
        if size < 3 {
            return result
        }
        let sortedNums = nums.sorted()
        for i in 0..<size-2 {
            if i > 0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }
            if sortedNums[i] + sortedNums[i+1] + sortedNums[i+2] > 0 {
                break
            }
            if sortedNums[i] + sortedNums[size-2] + sortedNums[size-1] < 0 {
                continue
            }
            var left = i + 1
            var right = size - 1
            while left < right {
                let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                if sum < 0 {
                    left += 1
                } else if sum > 0 {
                    right -= 1
                } else {
                    result.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                    repeat {
                        left += 1
                    } while sortedNums[left] == sortedNums[left-1] && left < right
                    repeat {
                        right -= 1
                    } while sortedNums[right] == sortedNums[right+1] && left < right
                }
            }
        }
        return result
    }
    
}

print(Solution.threeSum([8,5,3,9,12,-9,8,-9,13,-10,-14,-13,5,-15,-4,2,8,-11,-6,12,9,-15,13,11,13,13,6,-12,-15,-4,-6,0,-14,5,-14,5,3,2,4,2,7,5,4,-10,-3,7,7,-9,4,-14,10,-2,-13,8,-6,7,-1,7,11,-9,-12,-10,6,12,10,7,2,-9,-6,13,8,9,3,-11,14,-14,11,-2,14,0,-1,1,6,-7,-5,7,-14,9,0,4,7,-5,1,-2,14,-3,12,-6,-5,14,-8,-12,0,3,-8,-1]))
