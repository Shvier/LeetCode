//
//  main.swift
//  134-GasStation
//
//  Created by Shvier on 2018/6/5.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var startIndex = 0
        let countOfStations = gas.count
        for index in 0..<countOfStations {
            var leftGas = gas[index] - cost[index]
            if leftGas < 0 {
                continue
            }
            startIndex = index
            if index == countOfStations - 1 {
                if dfs(gas, cost, startIndex, 0, &leftGas, countOfStations) {
                    return startIndex
                }
            } else {
                if dfs(gas, cost, startIndex, startIndex + 1, &leftGas, countOfStations) {
                    return startIndex
                }
            }
        }
        return -1
    }
    
    func dfs(_ gas: [Int], _ cost: [Int], _ startIndex: Int, _ nextIndex: Int, _ leftGas: inout Int, _ countOfStations: Int) -> Bool {
        if startIndex == nextIndex {
            return true
        }
        let leftGasToNextStation = gas[nextIndex] + leftGas - cost[nextIndex]
        if leftGasToNextStation >= 0 {
            leftGas = leftGasToNextStation
            if nextIndex == countOfStations - 1 {
                return dfs(gas, cost, startIndex, 0, &leftGas, countOfStations)
            } else {
                return dfs(gas, cost, startIndex, nextIndex + 1, &leftGas, countOfStations)
            }
        } else {
            return false
        }
    }
    
}

let solution = Solution()
print(solution.canCompleteCircuit([2, 3, 4], [3, 4, 3]))
