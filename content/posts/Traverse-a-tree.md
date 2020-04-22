---
title: Traverse a tree
date: 2020-02-10
author: Haolin Yang
categories: ["Note"]
tag:
    - Traverse a tree
---

Idea to traverse a tree

## Tree structure

The tree structure:

```cpp
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};
```

### BFS DFS Pre-order In-order Post-order

Relationship:

![traverse](/images/2020-02-10-traverse-a-tree/145_transverse.png)

#### Iterative

Loop for BFS:

```cpp
void BFS(TreeNode *root){
    stack<TreeNode *> q;
    q.push(root);
    while(!q.empty()){
        TreeNode *temp = q.front();
        q.pop();
        // do something
        if(temp->left != NULL) q.push(temp -> left);
        if(temp->right != NULL) q.push(temp -> right);
    }
}
```

Loop for DFS:

Pre-order:

```cpp
void DFS(TreeNode *root){
    stack<TreeNode *> s;
    s.push(root);
    while(!s.empty()){
        TreeNode *temp = s.top();
        s.pop();
        // do something
        if(temp->right != NULL) s.push(temp -> right);
        if(temp->left != NULL) s.push(temp -> left);
    }
}
```

In-order:

```cpp
void DFS(TreeNode *root){
    stack<TreeNode *> s;
    TreeNode *cur = root;
    while(!s.empty() || cur != NULL){
        // To the left most
        while(cur != NULL){
            s.push(cur);
            cur = cur -> left
        }

        cur = s.top();
        s.pop();
        // do something

        cur = cur -> right;
    }
}
```

Post-order:

```cpp
void DFS(TreeNode *root){
    stack<TreeNode *> s;
    TreeNode *cur = root;
    do{
        while(cur != NULL){
            if(cur->right != NULL)
                s.push(cur->right);
            s.push(cur);
            cur = cur->left;
        }
        cur = s.top();
        s.pop();
        // if cur have right node and the right not visited (stack must have top)
        if(cur->right != NULL && !s.empty() && s.top() == cur -> right){
            // cur switch to cur->right. Original node is put back.
            s.pop();
            s.push(cur);
            cur = cur -> right;
        }
        // node which doesn't have right or right node is already been processed.
        else{
            // do something
            cur = NULL;
        }
    }while(!s.empty());
}
```

This is another method which is easy but not actually traverse the tree in post-order. This just can give a correct output res;

```cpp
vector<int> DFS(TreeNode *root){
      vector<int> res;
      stack<TreeNode *> s;
      s.push(root);
      while(!s.empty()){
          TreeNode *temp = s.top();
          s.pop();
          res.push_back(temp -> val);
          // do something
          if(temp->left != NULL) s.push(temp -> left);
          if(temp->right != NULL) s.push(temp -> right);
      }

      reverse(res.begin(), res.end());
      return res;
}
```

#### Recursive

Pre-order: (DFS is same)

```cpp
void preOrder(TreeNode *root){
    if(root == NULL) return;
    // root -> val do something
    preOrder(root -> left);
    preOrder(root -> right);
}
```

In-Order:

```cpp
void inOrder(TreeNode *root){
    if(root == NULL) return;

    inOrder(root -> left);
    // root -> val do something
    inOrder(root -> right);
}
```

Pre-Order: (Bottom-to-up)

```cpp
void postOrder(TreeNode *root){
    if(root == NULL) return;
    postOrder(root -> left);
    postOrder(root -> right);
    // root -> val do something
}
```

### BFS process level by level

```cpp
void BFS(TreeNode *root){
    stack<TreeNode *> q;
    q.push(root);
    while(!q.empty()){
        int levelSize = q.size();
        // get current level size so that BFS can process level by level
        for(int i=0; i<levelSize; ++i){
            TreeNode *temp = q.front();
            q.pop();
            // do something
            if(temp->left != NULL) q.push(temp -> left);
            if(temp->right != NULL) q.push(temp -> right);
        }
    }
}
```
