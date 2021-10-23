/*
 * @lc app=leetcode.cn id=4 lang=swift
 *
 * [4] 寻找两个正序数组的中位数
 *
 * https://leetcode-cn.com/problems/median-of-two-sorted-arrays/description/
 *
 * algorithms
 * Hard (40.93%)
 * Total Accepted:    532.5K
 * Total Submissions: 1.3M
 * Testcase Example:  '[1,3]\n[2]'
 *
 * 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums1 = [1,3], nums2 = [2]
 * 输出：2.00000
 * 解释：合并数组 = [1,2,3] ，中位数 2
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums1 = [1,2], nums2 = [3,4]
 * 输出：2.50000
 * 解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：nums1 = [0,0], nums2 = [0,0]
 * 输出：0.00000
 * 
 * 
 * 示例 4：
 * 
 * 
 * 输入：nums1 = [], nums2 = [1]
 * 输出：1.00000
 * 
 * 
 * 示例 5：
 * 
 * 
 * 输入：nums1 = [2], nums2 = []
 * 输出：2.00000
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * nums1.length == m
 * nums2.length == n
 * 0 
 * 0 
 * 1 
 * -10^6 
 * 
 * 
 * 
 * 
 * 进阶：你能设计一个时间复杂度为 O(log (m+n)) 的算法解决此问题吗？
 * //链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays/solution/4xun-zhao-liang-ge-zheng-xu-shu-zu-de-zhong-wei-3/ 
 */
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
      var mergeArray = [Int](repeating: 0, count: nums1.count+nums2.count)
      var i = 0
      var j = 0
    
      for index in 0..<mergeArray.count {
      
        if (j >= nums2.count) || (i < nums1.count && nums1[i] <= nums2[j])  {
          mergeArray[index] = nums1[i]
          i+=1
        } else  {
          //! if (i >= nums1.count || j < nums2.count && nums1[i] > nums2[j] 
          mergeArray[index] = nums2[j]
          j+=1
        }
      
      }

      if mergeArray.count % 2 == 0 {
        return Double(mergeArray[mergeArray.count/2-1] + mergeArray[mergeArray.count/2]) / 2.0
      } else {
        return Double(mergeArray[mergeArray.count/2])
      }
    }
}


