# Git overview


Here have some good pictures that is helpful for understanding git and contain the record for git commend

## Concept Map

Here is a concept map given by Udcity.com. This picture shows the relationship between these basic git concept.

![Concept map](/images/2019-06-17-gitLearningNote/conceptMap.png)

## Git Data Transport Map

Git have four working zones. This map shows that using which commend to shift your code from one zone to another.

![Git Data Transport Map](/images/2019-06-17-gitLearningNote/git-transport.png)

_This photo is provide by [osteele](https://blog.osteele.com/2008/05/my-git-workflow/)_

## Git commend and usage

### Initialize the git repository

`git init`

### Clone a repository by giving the URL (github)

`git clone <repository URL>`

### Show the status (Status of Index)

`git status`

### Show the log of commit

`git log`

#### show all logs in graph and each log in one line

`git log --graph --oneline <branch name> <branch name>`

#### show specific number of log

`git log -n <number>`

### Compare workspace and index

`git diff` compare workspace and index area (basically just show what you are not add)

`git diff head` compare index area and head in local repository

`git diff <commit ID>` compare index area and given commit ID in local repository

`git diff <commit ID> <commit ID>` compare two given commit

### Add

`git add <filename>`

`git add .` add all

### Commit

`git commit -m '...'`

#### add and commit

`git commit -am '...'`

### Branch

#### show all branch

`git branch`

#### Open a new branch

`git branch <branch name>`

#### Open a new branch and checkout

`git checkout -b <new branch name>`

### Push

`git push <remote name> <branch name>`

### Pull

`git pull <remote name> <branch name>`

### Merge

`git merge <branch>` merge a given branch to current branch

Eg: `git merge test` (when you on master branch) --> merge branch test into master.

### Remote

#### show all remote

`git remote`

#### show all remote detail

`git remote -v`

#### giving a new remote name and connect it to a URL

`git remote add <remote name> <URL>`

### Fetch

`git fetch <remote name>`

Without changing workspace, update local repository from remote repository

### Roll back

`git reset --soft HEAD~1` Roll back 1 commit into index area

`git reset --hard HEAD~2` Roll back 2 commits into workspace

### Remove some file in Index

`git rm --cached <file name>`

`git rm -r --cached .` This command will set file to be untracked.

`-r` means recursively

`--cached` means remove file in index

> Update **.gitignore**. delete something that you add in gitignore and commit before

### Rebase

Suppose we have this situation and you are **currently on branch _topic_**

```
      A---B---C topic
     /
D---E---F---G master
```

The _base_ of _topic_ is commit `E`. Therefore `rebase` means you change the _base_ depends on your given branch

After you run `git rebase master`, branch will be like:

```
              A'--B'--C' topic
             /
D---E---F---G master
```

## Compare merge, merge --squash and rebase

If we have two branches `master` and `topic`

```
      A---B---C topic
     /
D---E---F---G master
```

### merge

If run `git merge`

```
      A---B---C topic
     /         \
D---E---F---G---H master
```

### merge --squash

if fun `git merge --squash` and `git commit`

`H` combine `A B C`

```
      A---B---C topic
     /
D---E---F---G---H master
```

Now you have _topic_ branch and update the _master_. You may delete _topic_ later

### rebase

After you run `git rebase master` when you **on branch _topic_**:

```
              A'--B'--C' topic
             /
D---E---F---G master
```

You can `checkout` _master_ and run `git merge topic`:

```
D---E---F---G---A'---B'---C' master/topic
```

## Delete submodule

1. Delete the relevant section from the .gitmodules file.
2. Stage the .gitmodules changes git add .gitmodules
3. Delete the relevant section from .git/config.
4. Run git rm --cached path_to_submodule (no trailing slash).
5. Run rm -rf .git/modules/path_to_submodule (no trailing slash).
6. Commit git commit -m "Removed submodule "
7. Delete the now untracked submodule files rm -rf path_to_submodule

[Source](https://gist.github.com/myusuf3/7f645819ded92bda6677)

