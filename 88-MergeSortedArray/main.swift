//
//  main.swift
//  88-MergeSortedArray
//
//  Created by Shvier on 04/03/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1
        var j = n - 1
        var k = m + n - 1
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
                k -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
                k -= 1
            }
        }
        while j >= 0 {
            nums1[k] = nums2[j]
            j -= 1
            k -= 1
        }
    }
    
}

let solution = Solution()
var nums1 = [1, 2, 3, 0, 0, 0]
var nums2 = [2, 5, 6]
print(solution.merge(&nums1, 3, nums2, 3))
