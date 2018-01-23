//
//  main.swift
//  60-PermutationSequence
//
//  Created by Shvier on 23/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var ans = ""
        var factorials = [Int]()
        var numbers = [Int]()
        
        var sum = 1
        factorials.append(sum)
        for i in 1...n {
            sum *= i
            factorials.append(sum)
        }
        
        for i in 1...n {
            numbers.append(i)
        }
        
        var indexOfString = k-1
        for i in 1...n {
            let index = indexOfString/factorials[n-i]
            ans = "\(ans)\(numbers[index])"
            numbers.remove(at: index)
            indexOfString -= index*factorials[n-i]
        }
        
        return ans
    }
    
}
