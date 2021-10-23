/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 */

// @lc code=start
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var length = 0, chars = [Character]()
        s.forEach({
            if chars.contains($0) {
                chars.removeSubrange(0...chars.firstIndex(of: $0)!)
            }
            chars.append($0)
            length = max(length, chars.count)
        })
        return length
    }
}
// @lc code=end

