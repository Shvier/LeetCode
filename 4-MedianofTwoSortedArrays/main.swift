//
//  main.swift
//  4-MedianofTwoSortedArrays
//
//  Created by Shvier on 12/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let nums = nums1 + nums2
        let sortedNums = nums.sorted()
        let totalCount: Int = nums1.count + nums2.count
        if totalCount%2 != 0 {
            return Double(sortedNums[totalCount/2])
        } else {
            return (Double(sortedNums[totalCount/2]) + Double(sortedNums[totalCount/2-1]))/2
        }
    }
}

let nums1 = [1, 2]
let nums2 = [3]
print(Solution.findMedianSortedArrays(nums1, nums2))
