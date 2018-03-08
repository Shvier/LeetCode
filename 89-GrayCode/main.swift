//
//  main.swift
//  89-GrayCode
//
//  Created by Shvier on 05/03/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func grayCode(_ n: Int) -> [Int] {
        var ans = [Int]()
        ans.append(0)
        for i in 0..<n {
            let count = ans.count
            for j in (0..<count).reversed() {
                ans.append(ans[j] | 1 << i)
            }
        }
        return ans
    }
    
}
