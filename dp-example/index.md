# Dynamic Programming Example


## Longest common subsequence

This is a typical recursive problem. The pseudocode is:

```
If S1[i] == S2[j], lcs(S1[i:],S2[j:]) = 1 + lcs(S1[i+1:],S2[j+1:])
else lcs(S1[i:],S2[j:]) = max(lcs(S1[i:],S2[j+1:]), lcs(S1[i+1s:],S2[j:]))
```

### Recursive solution:

```cpp
int longestCommonSubsequence(string text1, string text2) {
    if(text1.size() == 0 || text2.size() == 0 ){
        return 0;
    }

    if(text1[0] == text2[0]){
        return 1 + longestCommonSubsequence(text1.substr(1, text1.size()-1), text2.substr(1, text1.size()-1));
    }

    return max(longestCommonSubsequence(text1, text2.substr(1, text1.size()-1)),
            longestCommonSubsequence(text1.substr(1, text1.size()-1), text2));
}
```

Time complexity: O(2^n)

Using dp could store the state that already calculate before.

### Top to Button DP solution:

```cpp
int lcs (string& s1, string& s2, int i, int j, vector<vector<int>>& dp){
    if(i == s1.size() || j == s2.size() ) return 0;
    if(dp[i][j] != -1) return dp[i][j];

    if(s1[i] == s2[j]) dp[i][j] = 1 + lcs(s1, s2, i+ 1, j + 1, dp);
    else dp[i][j] = max(lcs(s1,s2,i+1,j,dp), lcs(s1,s2,i,j+1,dp));

    return dp[i][j];
}

int longestCommonSubsequence(string text1, string text2) {
    // dp[i][j] ==> solution of s1[i:] & s2[j:]
    vector<vector<int>> dp(text1.size() , vector<int>(text2.size(), -1));

    return lcs(text1, text2, 0, 0, dp);

}
```

> This solution has same strategy with recursive solution but use dp table to store the state

### Button to Top DP solution:

### Similar question

[Longest Palindromic Subsequence](https://leetcode.com/problems/longest-palindromic-subsequence/)

## 0/1 backpack

