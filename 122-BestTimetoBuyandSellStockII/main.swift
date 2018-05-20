//
//  main.swift
//  122-BestTimetoBuyandSellStockII
//
//  Created by Shvier on 2018/5/20.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        var ans = 0
        if prices.count < 2 {
            return ans
        }
        for index in 0..<prices.count-1 {
            if prices[index+1] > prices[index] {
                ans += prices[index+1] - prices[index]
            }
        }
        return ans < 0 ? 0 : ans
    }
    
}
