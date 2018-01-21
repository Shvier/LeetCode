//
//  main.swift
//  57-InsertInterval
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
    
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        var newIntervals = [Interval]()
        var tempNewInterval = newInterval
        var index = 0
        while index < intervals.count && intervals[index].end < tempNewInterval.start {
            newIntervals.append(intervals[index])
            index += 1
        }
        while index < intervals.count && intervals[index].start <= tempNewInterval.end {
            tempNewInterval = Interval.init(min(intervals[index].start, tempNewInterval.start), max(intervals[index].end, tempNewInterval.end))
            index += 1
        }
        newIntervals.append(tempNewInterval)
        while index < intervals.count {
            newIntervals.append(intervals[index])
            index += 1
        }
        return newIntervals
    }
    
}
