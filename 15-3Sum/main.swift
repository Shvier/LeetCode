//
//  main.swift
//  15-3Sum
//
//  Created by Shvier on 02/11/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = Array<Array<Int>>()
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                for k in j+1...nums.count {
                    if k == nums.count {
                        break
                    }
                    let sum = nums[i] + nums[j] + nums[k]
                    if sum == 0 {
                        let num = Solution.seq(nums: [nums[i], nums[j] , nums[k]])
                        if result.count > 0 {
                            for numbers in result {
                                if Solution.equal(nums1: numbers, nums2: num) {
                                    break
                                }
                                if numbers == result.last! {
                                    result.append(num)
                                }
                            }
                        } else {
                            result.append(num)
                        }
                    }
                }
            }
        }
        return result
    }
    
    static func seq(nums: [Int]) -> [Int] {
        return nums.sorted()
    }
    
    static func equal(nums1: [Int], nums2: [Int]) -> Bool {
        var result: Bool = true
        for i in 0..<nums1.count {
            let num1 = nums1[i]
            let num2 = nums2[i]
            result = result && (num1 == num2)
        }
        return result
    }
    
}

print(Solution.threeSum([8,5,3,9,12,-9,8,-9,13,-10,-14,-13,5,-15,-4,2,8,-11,-6,12,9,-15,13,11,13,13,6,-12,-15,-4,-6,0,-14,5,-14,5,3,2,4,2,7,5,4,-10,-3,7,7,-9,4,-14,10,-2,-13,8,-6,7,-1,7,11,-9,-12,-10,6,12,10,7,2,-9,-6,13,8,9,3,-11,14,-14,11,-2,14,0,-1,1,6,-7,-5,7,-14,9,0,4,7,-5,1,-2,14,-3,12,-6,-5,14,-8,-12,0,3,-8,-1]))
