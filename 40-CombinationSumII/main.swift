//
//  main.swift
//  40-CombinationSumII
//
//  Created by Shvier on 15/12/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var sortedCandidates = candidates.sorted()
        var result = Array<Array<Int>>()
        let current = Array<Int>()
        backtrack(&result, &sortedCandidates, current: current, lastUse: 0, restTarget: target)
        return result
    }
    
    func backtrack(_ result: inout [[Int]], _ candidates: inout [Int], current: [Int], lastUse: Int, restTarget: Int) {
        if restTarget == 0 {
            var equals: Bool = false
            for array in result {
                if compare(array, current) {
                    equals = true
                    break
                }
            }
            if !equals {
                result.append(current)
            }
        }
        var newCurrent = current
        for i in lastUse..<candidates.count {
            if candidates[i] > restTarget {
                break
            }
            newCurrent.append(candidates[i])
            backtrack(&result, &candidates, current: newCurrent, lastUse: i+1, restTarget: restTarget-candidates[i])
            newCurrent.removeLast()
        }
    }
    
    func compare(_ array1: [Int], _ array2: [Int]) -> Bool {
        if array1.count != array2.count {
            return false
        }
        var equals: Bool = false
        for index in 0..<array1.count {
            equals = (array1[index] == array2[index])
        }
        return equals
    }
    
}

let solution = Solution()
solution.combinationSum2([10, 1, 2, 7, 6, 1, 5], 8)
