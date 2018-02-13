//
//  main.swift
//  77-Combinations
//
//  Created by Shvier on 13/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]]()
        if k > n {
            return ans
        }
        var temp = [Int]()
        for i in 1...n {
            subCombine(i, n, &temp, &ans)
        }
        return ans
    }
    
    func subCombine(_ start: Int, _ max: Int, _ temp: inout [Int], _ ans: inout [[Int]]) {
        if max <= temp.count {
            ans.append(temp)
            return
        }
        for i in start...max {
            
        }
    }
    
}
