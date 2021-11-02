/*
 * @lc app=leetcode.cn id=42 lang=swift
 *
 * [42] 接雨水
 *
 * https://leetcode-cn.com/problems/trapping-rain-water/description/
 *
 * algorithms
 * Hard (58.33%)
 * Total Accepted:    341.2K
 * Total Submissions: 584.1K
 * Testcase Example:  '[0,1,0,2,1,0,1,3,2,1,2,1]'
 *
 * 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 
 * 
 * 输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
 * 输出：6
 * 解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：height = [4,2,0,3,2,5]
 * 输出：9
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * n == height.length
 * 1 <= n <= 2 * 10^4
 * 0 <= height[i] <= 10^5
 * 
 * 
 */


class Solution {
    func trap(_ height: [Int]) -> Int {
        var ans = 0
        var countSize = height.count
        for i in 0..<countSize{
            var max_left = 0; var max_right = 0
            for j in (0...i).reversed(){
                max_left = max(max_left, height[j])
            }
            for j in i..<countSize{
                max_right = max(max_right, height[j])
            }
            ans += min(max_left,max_right) - height[i]
        }
        return ans
    }
}


/*
   直接按问题描述进行处理:
对于数组中的每个元素，我们找出下雨后水能达到的最高位置，等于两边最大高度的较小值减去当前高度的值
暴力法:
* 初始化 ans=0
* 遍历数组：
- 初始化 max_left = 0 max_right = 0
- 从当前元素中左扫描
- max_left = max(max_left ,heghit[j])
- 从当前元素向右扫描
- max_right = max(max_right ,heghit[j])
- 将min(max_left, max_right) -height[i] 累加到ans

作者：jiaohao
链接：https://leetcode-cn.com/problems/trapping-rain-water/solution/bao-li-fa-qiu-jie-by-jiaohao-x2v9/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
