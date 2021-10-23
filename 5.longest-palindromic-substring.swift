/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 *
 * https://leetcode-cn.com/problems/longest-palindromic-substring/description/
 *
 * algorithms
 * Medium (35.60%)
 * Total Accepted:    763.1K
 * Total Submissions: 2.1M
 * Testcase Example:  '"babad"'
 *
 * 给你一个字符串 s，找到 s 中最长的回文子串。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：s = "babad"
 * 输出："bab"
 * 解释："aba" 同样是符合题意的答案。
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：s = "cbbd"
 * 输出："bb"
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：s = "a"
 * 输出："a"
 * 
 * 
 * 示例 4：
 * 
 * 
 * 输入：s = "ac"
 * 输出："a"
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * s 仅由数字和英文字母（大写和/或小写）组成
 * 
 * 链接：https://leetcode-cn.com/problems/longest-palindromic-substring/solution/zhong-xin-kuo-san-fa-by-fa-dou-miao-7rzy/
 */
/*
1. 通过遍历，取到第一个字符
2. 设，该字符为回文串的中心字符
3. 回文串有两种，一种是(abba)，一种是(abcba)，也就是单数或双数两种
4. 同时还有相同字符的回文串，例如(aaa),(bbbb)
5. 所以，在遍历一开始，设置start与end为 i。设默认情况为单数回文串
6. 然后通过 while 循环，【分别】对 start 进行左移 ，对 end 进行右移， 判断是否为双数回文串
7. 再通过 while 对回文串同时进行 start -= 1 与 end += 1
8. 如果获取到的 start -= 1 的字符 与 end += 1 的字符相同， 则扩大回文串。否则退出循环
9. 当所有遍历循环结束时， dic字典中，存放着回文串的长度，start与end
10. 通过start，end拼接出完整字符串，并return
 */

class Solution {
    func longestPalindrome(_ s: String) -> String {
        var start = 0
        var end = 0
        let strAry = Array(s)
        
        var i = 0
        var dic = [String : Int]()
        
        for element in strAry {
            start = i
            end = i
            
            while start - 1 >= 0 { // 左移多位判断
                if strAry[start - 1] == element {
                    start -= 1
                }else {
                    break
                }
            }
            
            while end + 1 <= (strAry.count - 1) {  // 右移多位判断
                if strAry[end + 1] == element {
                    end += 1
                }else {
                    break
                }
            }
            
            while start >= 0 && end <= (strAry.count - 1) { // 判断是否为回文串
                if start != end {
                    if strAry[start] == strAry[end] { // 子字符
                        if dic["count"] ?? 0 < (end - start + 1) {
                            dic["count"] = end - start + 1
                            dic["start"] = start
                            dic["end"] = end
                        }
                    }else {
                        break
                    }
                }
                
                start -= 1
                end += 1
            }
            
            
            i += 1
        }
        
        var newStr = [String]()
        start = dic["start"] ?? 0
        end = dic["end"] ?? 0
        
        for index in start ... end {
            newStr.append(strAry[index].description)
        }
        
        return newStr.joined()
    }
}


