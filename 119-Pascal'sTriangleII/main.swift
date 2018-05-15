//
//  main.swift
//  119-Pascal'sTriangleII
//
//  Created by Shvier on 2018/5/14.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func getRow(_ rowIndex: Int) -> [Int] {
        var ans = [Int]()
        if rowIndex < 0 {
            return ans
        }
        for _ in 0...rowIndex {
            ans.insert(1, at: 0)
            if ans.count-1 <= 1 {
                continue
            }
            for j in 1..<ans.count-1 {
                ans[j] = ans[j] + ans[j+1]
            }
        }
        return ans
    }
    
}
