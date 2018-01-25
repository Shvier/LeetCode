//
//  main.swift
//  62-UniquePaths
//
//  Created by Shvier on 25/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var path = Array(repeating: Array(repeatElement(1, count: n)), count: m)
        for i in 1..<m {
            for j in 1..<n {
                path[i][j] = path[i-1][j] + path[i][j-1]
            }
        }
        return path[m-1][n-1]
    }
    
}

let solution = Solution()
print(solution.uniquePaths(3, 7))
