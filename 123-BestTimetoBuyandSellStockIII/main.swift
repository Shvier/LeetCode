//
//  main.swift
//  123-BestTimetoBuyandSellStockIII
//
//  Created by Shvier on 2018/5/22.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        var buy1 = Int.min
        var sold1 = 0
        var buy2 = Int.min
        var sold2 = 0
        for price in prices {
            buy1 = max(buy1, -price)
            sold1 = max(sold1, buy1+price)
            buy2 = max(buy2, sold1-price)
            sold2 = max(sold2, buy2+price)
        }
        return sold2
    }
    
}
