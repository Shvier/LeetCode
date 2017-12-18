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
            result.append(current)
        }
        var newCurrent = current
        for i in lastUse..<candidates.count {
            if candidates[i] > restTarget {
                break
            }
            if i > lastUse && candidates[i] == candidates[i-1] {
                continue
            }
            newCurrent.append(candidates[i])
            backtrack(&result, &candidates, current: newCurrent, lastUse: i+1, restTarget: restTarget-candidates[i])
            newCurrent.removeLast()
        }
    }
    
}

let solution = Solution()
solution.combinationSum2([4, 1, 1, 4, 4, 4, 4, 2, 3, 5], 10)
