//
//  main.swift
//  6-ZigZagConversion
//
//  Created by Shvier on 14/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func convert(_ s: String, _ numRows: Int) -> String {
        if s.lengthOfBytes(using: .utf8) < 1 {
            return s
        }
        if numRows == 1 {
            return s
        }
        let characters = [Character](s.characters)
        var countInOneDuration: Int = 0
        if numRows == 1 {
            countInOneDuration = numRows
        } else {
            countInOneDuration = numRows + numRows - 2
        }
        let durationCount = characters.count/countInOneDuration
        let countsBeyondDuration = characters.count%countInOneDuration
        let colsInOneDuration = numRows - 1
        var colsBeyondDuration = 0
        if countsBeyondDuration <= numRows {
            colsBeyondDuration = 1
        } else {
            colsBeyondDuration = 1 + countsBeyondDuration - numRows
        }
        let numCols = colsInOneDuration*durationCount + colsBeyondDuration
        var letters = Array(repeating: Array<String>(repeating: "", count: numCols), count: numRows)
        var i: Int = 0
        for character in characters {
            let position = Solution.correspondingIndex(index: i, numRows: numRows)
            letters[position.0][position.1] = String(character)
            i += 1
        }
        var result = ""
        for strings in letters {
            result += strings.joined()
        }
        for strings in letters {
            for string in strings {
                print(string)
                print(" ")
            }
            print("\n")
        }
        return result
    }
    
    static func correspondingIndex(index: Int, numRows: Int) -> (Int, Int) {
        var countInOneDuration: Int = 0
        if numRows == 1 {
            countInOneDuration = numRows
        } else {
            countInOneDuration = numRows + numRows - 2
        }
        let colsInOneDuration = numRows - 1

        var x: Int = 0
        var y: Int = 0
        let indexOfDuration = index/countInOneDuration
        let countBeyondDuration = index%countInOneDuration
        var indexBeyondDuration: Int = 0
        if countBeyondDuration <= numRows - 1 {
            indexBeyondDuration = countBeyondDuration
            y = indexOfDuration*colsInOneDuration
            x = indexBeyondDuration
        } else {
            indexBeyondDuration = countBeyondDuration - numRows + 1
            y = indexOfDuration*colsInOneDuration + indexBeyondDuration
            x = numRows - indexBeyondDuration - 1
        }
        return (x, y)
    }
    
}

print(Solution.convert("nywxjowtmvluoyijcuskwwgabuoqtaqgyodkcbdpyojmntxropeknkkqhagacyidnnnprqepgqevjbnxttjgfwxmwdozcyepmrgfhnundyjmcymvtxbytalqebriavxoodtvqnkvovksvwnovqnprahvbyfbvcpjhkgaysxoqhgnfvcblrqctxzuxeyuipdsalsafroxzwlerphcgxhzwivtntnxlspnfjnlbdkczvgqkouqnbrkknfzityvnqitzvgcyqezmnpydkrsniczxiyidzdspolqjttkmzjaobyrnpkaaoazyahdznwobjhmdaypbkpqlnjyftafkagkdoocdktgtasyctnddcvosfozaogkrmvuclyfvrlqtgpvzebchwsbbgacwionulhxwgctzqktwbqvfrzoqrrrztvvbmlwxstwaxpcnbxlcngkhhyxaqqzlovnagjzacvdznhpoeattjfcqdbrvsshgpwixfhajffksmzisadlliqboruljpureqbcxlcgqhrkvqunsaadiqhyidmtsgnxzobwbfdrowdjmayhaymiptjzzvurdhqeytbzygtocwxqwvxwukhlfsmgpgyuoqzmmcnkigzkdycbwaasmjdtdpasxamlslzennrxt", 553))
