//
//  main.swift
//  93-RestoreIPAddresses
//
//  Created by Shvier on 11/03/2018.
//  Copyright © 2018 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    func restoreIpAddresses(_ s: String) -> [String] {
        var ans = [String]()
        let count = s.lengthOfBytes(using: .utf8)
        if count >= 4 {
            for i in 1..<count-2 {
                if i >= 4 {
                    break
                }
                for j in i+1..<count-1 {
                    if j >= i+4 {
                        break
                    }
                    for k in j+1..<count {
                        if k >= j+4 {
                            break
                        }
                        let startIndex = s.startIndex
                        let s1 = s.substring(to: s.index(startIndex, offsetBy: i))
                        let s2 = s.substring(with: s.index(startIndex, offsetBy: i)..<s.index(startIndex, offsetBy: j))
                        let s3 = s.substring(with: s.index(startIndex, offsetBy: j)..<s.index(startIndex, offsetBy: k))
                        let s4 = s.substring(from: s.index(startIndex, offsetBy: k))
                        if isValid(s1) && isValid(s2) && isValid(s3) && isValid(s4) {
                            ans.append("\(s1).\(s2).\(s3).\(s4)")
                        }
                    }
                }
            }
        }
        return ans
    }
    
    func isValid(_ ipAddress: String) -> Bool {
        if ipAddress.lengthOfBytes(using: .utf8) > 3 ||
            ipAddress.lengthOfBytes(using: .utf8) < 1 ||
            ipAddress.hasPrefix("0") && ipAddress.lengthOfBytes(using: .utf8) > 1 ||
            Int.init(ipAddress)! > 255 {
            return false
        }
        return true
    }
    
}

let solution = Solution()
print(solution.restoreIpAddresses("25525511135"))
