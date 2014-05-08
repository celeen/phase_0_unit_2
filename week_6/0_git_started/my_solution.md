## Release 2: Basic Git Commands
Define the following commands and describe how they work/what they do.  


#### add
adds file name specificed to staging area. 

#### branch
creates a new branch no need to specify an addition here, like '-m'. Just write the name of the new branch after the command.

#### checkout
takes a look at a different branch in a repository

#### clone
clones the respository specified onto your local computer, in whichever directory you're in
'git clone [url]' takes the repo at that url and copies it to whatever directory the terminal is currently in

#### commit
Takes a snapshot of repository, including any changes you've made since the last commit or snapshot. add a message with -m 'message content'
-a option skips staging

#### fetch
fetches changes from a remote repository of your specification

#### log
prints the log of commits. you can add -<n> to limit the number of commits shown, or -p to show the differences. There are about a million other ways to customize this command, too.

#### merge
brings one branch in sync with another by merging changes. If any one section of any one file is in conflict between branches, a merge conflict will appear, and request resolution: ie, you will tell git which parts to keep.

#### pull
fetches and merges changes from a remote branch or repo

#### push
pushes your commits to a remote server (in most cases github)

#### reset
UNstages a file

#### rm
removes a file from git; if you've deleted a file from your local directory, rm will then stop git from tracking it 

#### status
pulls a message with any untracked files, and which changes have been made, as well as changes (by file name) that are in the staging area

## Release 4: Git Workflow

- Push files to a remote repository
- Fetch changes
- Commit locally

## Release 5: Reflection