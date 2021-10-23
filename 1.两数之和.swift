/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 */

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
/*
1. 使用哈希表，可以将寻找 target - x 的时间复杂度降低到从 O(N)O(N) 降低到 O(1)O(1)。
2. 这样我们创建一个哈希表，对于每一个 x，我们首先查询哈希表中是否存在 target - x，然后将 x 插入到哈希表中，即可保证不会让 x 和自己匹配。
*/
//时间复杂度：O(N)，其中 N 是数组中的元素数量。对于每一个元素 x，我们可以 O(1) 地寻找 target - x。
// 空间复杂度：O(N)，其中 N 是数组中的元素数量。主要为哈希表的开销。
// 链接：https://leetcode-cn.com/problems/two-sum/solution/liang-shu-zhi-he-by-leetcode-solution/

        var dict: [Int: Int] = [:]
        
        for (i, n) in nums.enumerated() {
            if let index = dict[target - n] {
                return [i, index]
            }
            dict[n] = i
        }
        
        return []
    }
}
// @lc code=end

