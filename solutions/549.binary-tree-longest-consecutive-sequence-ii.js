/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */
var longestConsecutive = function(root) {
    let max = 0
    const dfs = (node) => {
        if(!node) return [0, 0]
        let inr = 1, dcr=1
        
        const left = dfs(node.left)
        if(node.val === node.left?.val - 1) {
            dcr = left[1] + 1
        } else if(node.val === node.left?.val + 1) {
            inr = left[0] + 1
        }

        const right = dfs(node.right)
        if(node.val === node.right?.val - 1) {
            dcr = Math.max(dcr, right[1]+1)
        } else if(node.val === node.right?.val + 1) {
            inr = Math.max(inr, right[0]+1)
        }

        max = Math.max(max, dcr+inr-1)
        return [inr, dcr]
    }
    dfs(root)
    return max
};