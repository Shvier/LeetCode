//
//  main.swift
//  84-LargestRectangleinHistogram
//
//  Created by Shvier on 23/02/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let count = heights.count
        var ans = 0
        if count < 1 {
            return ans
        }
        var left = Array(repeating: 0, count: count)
        var right = Array(repeating: 0, count: count)
        
        right[count-1] = 1
        for index in (0..<count-1).reversed() {
            if heights[index] > heights[index+1] {
                right[index] = 1
            } else {
                var bound = index+1
                while bound < count && heights[bound] >= heights[index] {
                    bound += right[bound]
                }
                right[index] = bound - index
            }
        }
        
        left[0] = 1
        for index in 1..<count {
            if heights[index] > heights[index-1] {
                left[index] = 1
            } else {
                var bound = index-1
                while bound >= 0 && heights[bound] >= heights[index] {
                    bound -= left[bound]
                }
                left[index] = index - bound
            }
        }
        
        ans = heights[0]
        for index in 0..<count {
            ans = max(heights[index]*(left[index]+right[index]-1), ans)
        }
        return ans
    }
    
}

let solution = Solution()
print(solution.largestRectangleArea([2, 1, 2]))
