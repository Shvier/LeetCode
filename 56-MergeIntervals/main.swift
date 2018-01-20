//
//  main.swift
//  56-MergeIntervals
//
//  Created by Shvier on 20/01/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation


// Definition for an interval.
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

class Solution {
    
    func merge(_ intervals: [Interval]) -> [Interval] {
        if intervals.count < 1 {
            return [Interval]()
        }
        let sortedIntervals = intervals.sorted { (interval1, interval2) -> Bool in
            return interval1.start < interval2.start
        }
        var mergedIntervals = [Interval]()
        mergedIntervals.append(sortedIntervals.first!)
        if sortedIntervals.count < 2 {
            return mergedIntervals
        }
        for i in 1..<sortedIntervals.count {
            let currentInterval = sortedIntervals[i]
            var merged = false
            for j in 0..<mergedIntervals.count {
                var interval = mergedIntervals[j]
                if currentInterval.start <= interval.end && currentInterval.start >= interval.start {
                    interval = Interval.init(min(currentInterval.start, interval.start), max(currentInterval.end, interval.end))
                    mergedIntervals[j] = interval
                    merged = true
                    break
                }
            }
            if !merged {
                mergedIntervals.append(currentInterval)
            }
        }
        return mergedIntervals
    }
    
}

let solution = Solution()
let interval1 = Interval.init(1, 4)
let interval2 = Interval.init(2, 3)
let interval3 = Interval.init(8, 10)
let interval4 = Interval.init(15, 18)
print(solution.merge([interval1, interval2]))
