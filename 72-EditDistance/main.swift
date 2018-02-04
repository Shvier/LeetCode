//
//  main.swift
//  72-EditDistance
//
//  Created by Shvier on 04/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let characters1 = [Character](word1.characters)
        let characters2 = [Character](word2.characters)
        let length1 = characters1.count
        let length2 = characters2.count
        var ans = Array(repeating: Array(repeatElement(0, count: length2+1)), count: length1+1)
        if length1 > 0 {
            for index in 1...length1 {
                ans[index][0] = index
            }
        }
        if length2 > 0 {
            for index in 1...length2 {
                ans[0][index] = index
            }
        }
        if length1 > 0 && length2 > 0 {
            for i in 1...length1 {
                for j in 1...length2 {
                    if characters1[i-1] == characters2[j-1] {
                        ans[i][j] = ans[i-1][j-1]
                    } else {
                        ans[i][j] = min(ans[i-1][j-1]+1, ans[i-1][j]+1, ans[i][j-1]+1)
                    }
                }
            }
        }
        return ans[length1][length2]
    }
    
}
