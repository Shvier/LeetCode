//
//  main.swift
//  121-BestTimetoBuyandSellStock
//
//  Created by Shvier on 2018/5/19.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        var ans = 0
        var start = 0
        if prices.count < 1 {
            return ans
        } else {
            start = prices[0]
        }
        for price in prices {
            ans = max(price - start, ans)
            start = min(price, start)
        }
        return ans < 0 ? 0 : ans
    }
    
}
