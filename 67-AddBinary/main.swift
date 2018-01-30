//
//  main.swift
//  67-AddBinary
//
//  Created by Shvier on 29/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func addBinary(_ a: String, _ b: String) -> String {
        let charactersA = [Character](a.characters)
        let charactersB = [Character](b.characters)
        var indexA = charactersA.count - 1
        var indexB = charactersB.count - 1
        var carried = false
        var ans = ""
        while indexA >= 0 || indexB >= 0 {
            var charA = ""
            var charB = ""
            if indexA >= 0 {
                charA = String(charactersA[indexA])
            }
            if indexB >= 0 {
                charB = String(charactersB[indexB])
            }
            if carried {
                if charA == "1" && charB == "1" {
                    ans = "1\(ans)"
                    carried = true
                } else if (charA == "1" && charB != "1") || (charA != "1" && charB == "1") {
                    ans = "0\(ans)"
                    carried = true
                } else {
                    ans = "1\(ans)"
                    carried = false
                }
            } else {
                if charA == "1" && charB == "1" {
                    ans = "0\(ans)"
                    carried = true
                } else if (charA == "1" && charB != "1") || (charA != "1" && charB == "1") {
                    ans = "1\(ans)"
                    carried = false
                } else {
                    ans = "0\(ans)"
                    carried = false
                }
            }
            indexA -= 1
            indexB -= 1
        }
        if carried {
            ans = "1\(ans)"
        }
        return ans
    }
    
}

let solution = Solution()
print(solution.addBinary("1010", "1011"))
