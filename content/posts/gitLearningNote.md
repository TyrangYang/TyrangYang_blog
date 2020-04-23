---
title: Git overview
date: 2019-06-17
author: Haolin Yang
categories: ['Overview']
tags:
    - git
---

Here have some good pictures that is helpful for understanding git and contain the record for git commend

## Concept Map

Here is a concept map given by Udcity.com. This picture shows the relationship between these basic git concept.

![Concept map](/images/2019-06-17-gitLearningNote/conceptMap.png)

## Git Data Transport Map

Git have four working zones. This map shows that using which commend to shift your code from one zone to another.

![Git Data Transport Map](/images/2019-06-17-gitLearningNote/git-transport.png)

_This photo is provide by [osteele](https://blog.osteele.com/2008/05/my-git-workflow/)_

## Git commend and usage

-   Initialize the git repository

```
git init
```

-   Clone a repository by giving the URL (github)

```
git clone <repository URL>
```

-   Show the status (Status of Index)

```
git status
```

-   Show the log of commit

```
git log
```

    + show all logs in graph and each log in one line

```
git log --graph --oneline <branch name> <branch name>
```

    + show specific number of log

```
git log -n <number>
```

-   Compare workspace and index

```
git diff
git diff <commit ID> <commit ID>
```

```
git diff --stage
```

> 这是用来对比两个 commit 的区别.
> 如果没有写两个 ID，就是对比暂存区和工作区 （暂存区是最近 commit 的 commit 的 copy)
>
> 这就是对比暂存区和最近的 commit

-   Add

```
git add <filename>
```

-   Commit

```
git commit
```

-   Branch
    -   show all branch

```
git branch
```

    - Open a new branch

```
git branch <branch name>
```

    - Open a new branch and checkout

```
git checkout -b <new branch name>
```

-   Merge

```
git merge <branch2> <branch3>
```

this is merge branch3 into branch2

Eg: `git merge master test` or `git merge test` (when you on master branch)

> merge branch test into master.

> git merge 还将在合并的版本中包含当前检出的分支。因此，如果检出了 branch1，并且运行 git merge branch2 branch3，则合并的版本会将 branch1 以及 branch2 和 branch3 组合起来。由于在你进行合并提交后 branch1 标签将会更新，因此，你不想将 branch1 中的更改包含在合并中是不可能的。有鉴于此，在合并之前应始终检出你打算合并的两个分支之一。应检出哪个分支取决于你想让哪个分支标签指向新的提交。
>
> 由于检出的分支始终包含在合并中，在合并两个分支时，无需在命令行上将两者都指定为 git merge 的参数。如果想将 branch2 合并到 branch1 中，只需键入 git checkout branch1，然后键入 git merge branch2 即可。键入 git merge branch1 branch2 的唯一原因是，它能帮助你对要合并的分支更加心中有数。

-   Remote
    -   show all remote

```
git remote
```

    - show all remote detail

```
git remote -v
```

    - giving a new remote name and connect it to a URL

```
git remote add <remote name> <URL>
```

> 建立一个新的 remote,并和你的 repository 联系起来。 一般只有一个的时候都叫做 origin。
> 因此一般是 git remote add origin <URL>

-   Push

```
git push <remote name> <branch name>
```

-   Pull

```
git pull <remote name> <branch name>
```

-   Fetch

```
git fetch <remote name>
```

> 使得本地的 master 不变更新远端的 master 分支 <remote name>/master

-   Roll back 1 commit

```
git reset --soft HEAD~1//
```

-   Remove some file in Index

```
git rm --cached <file name>
git rm -r --cached .
```

> 用于更新.gitignore
> 因为一旦 git 追踪到了一个文件

-   rebase

```
git rebase
```
