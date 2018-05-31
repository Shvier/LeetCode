//
//  main.swift
//  18-4Sum
//
//  Created by Shvier on 10/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = Array<Array<Int>>()
        let size = nums.count
        if size < 4 {
            return result
        }
        let sortedNums = nums.sorted()
        for i in 0..<size-3 {
            if i > 0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }
            if sortedNums[i] + sortedNums[i+1] + sortedNums[i+2] + sortedNums[i+3] > target {
                break
            }
            if sortedNums[i] + sortedNums[size-3] + sortedNums[size-2] + sortedNums[size-1] < target {
                continue
            }
            for j in i+1..<size-2 {
                if j>i+1 && sortedNums[j] == sortedNums[j-1] {
                    continue
                }
                if sortedNums[i] + sortedNums[j] + sortedNums[j+1] + sortedNums[j+2] > target {
                    break
                }
                if sortedNums[i] + sortedNums[size-3] + sortedNums[size-2] + sortedNums[size-1] < target {
                    continue
                }
                var left = j + 1
                var right = size - 1
                while left < right {
                    let sum = sortedNums[left] + sortedNums[right] + sortedNums[i] + sortedNums[j]
                    if sum < target {
                        left += 1
                    } else if sum > target {
                        right -= 1
                    } else {
                        result.append([sortedNums[i], sortedNums[j], sortedNums[left], sortedNums[right]])
                        repeat {
                            left += 1
                        } while sortedNums[left] == sortedNums[left-1] && left < right
                        repeat {
                            right -= 1
                        } while sortedNums[right] == sortedNums[right+1] && left < right
                    }
                }
            }
        }
        return result
    }
    
}

let solution = Solution()
print(solution.fourSum([1, 0, -1, 0, -2, 2], 0))
