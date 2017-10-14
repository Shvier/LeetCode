//
//  main.swift
//  5-LongestPalindromicSubstring
//
//  Created by Shvier on 14/10/2017.
//  Copyright © 2017 Shvier. All rights reserved.
//

import Foundation

class Solution {
    
    // TLE
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
    
    // TLE
    static func longest(_ s: String) -> String {
        var start: Int = 0
        var end: Int = 0
        for i in 0..<s.lengthOfBytes(using: .utf8) {
            let length1 = Solution.expandAroundCenter(s: s, left: i, right: i)
            let length2 = Solution.expandAroundCenter(s: s, left: i, right: i + 1)
            let length = max(length1, length2)
            if length > (end - start) {
                start = i - (length - 1)/2
                end = i + length/2
            }
        }
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end)
        return s[startIndex...endIndex]
    }
    
    static func expandAroundCenter(s: String, left: Int, right: Int) -> Int {
        let characters = [Character](s.characters)
        var l = left
        var r = right
        while l >= 0 && r < s.lengthOfBytes(using: .utf8) && characters[l] == characters[r] {
            l -= 1
            r += 1
        }
        return r - l - 1
    }
    
}

print(Solution.longestPalindrome("nmngaowrbsssvihklwmuqshcddwlxrywrlwtennwfvrevgvhsvgeccfulmuvrcksdmgeqrblnlwoepefhcwhmgyvgcoyyygrmttyfycxwbqktpurlcfhzlakhmrddsydgygganpmaglaxyhfwjusukzcnakznygqplngnkhcowavxoiwrfycxwdkxqfcjqwyqutcpyedbnuogedwobsktgioqdczxhikjrbkmqspnxcpngfdwdaboscqbkwforihzqdcppxjksiujfvlpdjryewaxgmdgigvxdlstxwngtbdrrkfudjinzyxbdmkautclvvyguekuzwwetmsxittgtxbnvvrgasvnlogdiepltweaehubwelznidltzlbzdsrxmhjpkmylnwkdsxnpkplkdzywioluaqguowtbaoqzqgjfewphqcvlnwlojbxgomvxxkhwwykawegxubjiobizicuxzeafgautefsurgjlbhcfevqzsbhwxycrcaibdsgluczcuewzqupakbzmcvzsfodbmgtugnihyhqkvyeboqhqldifbxuaxqzxtyejoswikbzpsvzkxcndgeyvfnyrfbkhlalzpqjueibnodamgpnxlkvwvliouvejcpnakllfxepldfmdzszagkyhdgqqbkb"))

print(Solution.longest("kztakrekvefgchersuoiuatzlmwynzjhdqqftjcqmntoyckqfawikkdrnfgbwtdpbkymvwoumurjdzygyzsbmwzpcxcdmmpwzmeibligwiiqbecxwyxigikoewwrczkanwwqukszsbjukzumzladrvjefpegyicsgctdvldetuegxwihdtitqrdmygdrsweahfrepdcudvyvrggbkthztxwicyzazjyeztytwiyybqdsczozvtegodacdokczfmwqfmyuixbeeqluqcqwxpyrkpfcdosttzooykpvdykfxulttvvwnzftndvhsvpgrgdzsvfxdtzztdiswgwxzvbpsjlizlfrlgvlnwbjwbujafjaedivvgnbgwcdbzbdbprqrflfhahsvlcekeyqueyxjfetkxpapbeejoxwxlgepmxzowldsmqllpzeymakcshfzkvyykwljeltutdmrhxcbzizihzinywggzjctzasvefcxmhnusdvlderconvaisaetcdldeveeemhugipfzbhrwidcjpfrumshbdofchpgcsbkvaexfmenpsuodatxjavoszcitjewflejjmsuvyuyrkumednsfkbgvbqxfphfqeqozcnabmtedffvzwbgbzbfydiyaevoqtfmzxaujdydtjftapkpdhnbmrylcibzuqqynvnsihmyxdcrfftkuoymzoxpnashaderlosnkxbhamkkxfhwjsyehkmblhppbyspmcwuoguptliashefdklokjpggfiixozsrlwmeksmzdcvipgkwxwynzsvxnqtchgwwadqybkguscfyrbyxudzrxacoplmcqcsmkraimfwbauvytkxdnglwfuvehpxd"))
