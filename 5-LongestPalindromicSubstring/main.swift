//
//  main.swift
//  5-LongestPalindromicSubstring
//
//  Created by Shvier on 14/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    static func isValid(s: String) -> Bool {
        let length = s.lengthOfBytes(using: .utf8)
        let array = Array(s.characters)
        for i in 0..<length/2 {
            let leftLetter = array[i]
            let rightLetter = array[length - i - 1]
            if leftLetter != rightLetter {
                return false
            }
        }
        return true
    }
    
    static func longestPalindrome(_ s: String) -> String {
        var reverseString = ""
        for letter in s.characters {
            reverseString = "\(letter)" + reverseString
        }
        let reverseCharacters = [Character](reverseString.characters)
        let normalCharacters = [Character](s.characters)
        var matrix = Array(repeating: [Int](repeating: 0, count: reverseCharacters.count), count: reverseCharacters.count)
        var zone: Int = 0
        var result: String = ""
        var results = Array<String>()
        for i in 0..<normalCharacters.count {
            let normalCharacter = String(normalCharacters[i])
            for j in 0..<reverseCharacters.count {
                let reverseCharacter = String(reverseCharacters[j])
                if normalCharacter == reverseCharacter {
                    if i == 0 || j == 0 {
                        matrix[i][j] = 1
                    } else {
                        matrix[i][j] = matrix[i-1][j-1] + 1
                    }
                    if matrix[i][j] >= zone {
                        zone = matrix[i][j]
                        let startIndex = s.index(s.startIndex, offsetBy: i-zone+1)
                        let endIndex = s.index(s.startIndex, offsetBy: i)
                        result = String(s[startIndex...endIndex])
                        results.append(result)
                    } else if matrix[i][j] == zone {
                        let startIndex = s.index(s.startIndex, offsetBy: i-zone+1)
                        let endIndex = s.index(s.startIndex, offsetBy: i)
                        let tmp = String(s[startIndex...endIndex])
                        results.append(tmp!)
                    }
                } else {
                    matrix[i][j] = 0
                }
            }
        }
        result = ""
        for string in results {
            if string.lengthOfBytes(using: .utf8) > result.lengthOfBytes(using: .utf8) {
                if Solution.isValid(s: string) {
                    result = string
                }
            }
        }
        return result
    }
}

print(Solution.longestPalindrome("nmngaowrbsssvihklwmuqshcddwlxrywrlwtennwfvrevgvhsvgeccfulmuvrcksdmgeqrblnlwoepefhcwhmgyvgcoyyygrmttyfycxwbqktpurlcfhzlakhmrddsydgygganpmaglaxyhfwjusukzcnakznygqplngnkhcowavxoiwrfycxwdkxqfcjqwyqutcpyedbnuogedwobsktgioqdczxhikjrbkmqspnxcpngfdwdaboscqbkwforihzqdcppxjksiujfvlpdjryewaxgmdgigvxdlstxwngtbdrrkfudjinzyxbdmkautclvvyguekuzwwetmsxittgtxbnvvrgasvnlogdiepltweaehubwelznidltzlbzdsrxmhjpkmylnwkdsxnpkplkdzywioluaqguowtbaoqzqgjfewphqcvlnwlojbxgomvxxkhwwykawegxubjiobizicuxzeafgautefsurgjlbhcfevqzsbhwxycrcaibdsgluczcuewzqupakbzmcvzsfodbmgtugnihyhqkvyeboqhqldifbxuaxqzxtyejoswikbzpsvzkxcndgeyvfnyrfbkhlalzpqjueibnodamgpnxlkvwvliouvejcpnakllfxepldfmdzszagkyhdgqqbkb"))
