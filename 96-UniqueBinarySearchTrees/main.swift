//
//  main.swift
//  96-UniqueBinarySearchTrees
//
//  Created by Shvier on 12/03/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func numTrees(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        var ans = Array(repeating: 0, count: n+1)
        ans[0] = 1
        ans[1] = 1
        for i in 2...n {
            for j in 1...i {
                ans[i] += ans[j-1]*ans[i-j]
            }
        }
        return ans[n]
    }
    
}
