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
        var position = 0
        for number in nums2 {
            if number < nums1[position] {
                nums1.insert(number, at: position)
            } else {
                if position != nums1.count-1 {
                    for index in position..<nums1.count {
                        if number < nums1[index] {
                            nums1.insert(number, at: index)
                            position = index
                            break
                        }
                    }
                    position = nums1.count-1
                } else {
                    nums1.append(number)
                }
            }
        }
    }
    
}
