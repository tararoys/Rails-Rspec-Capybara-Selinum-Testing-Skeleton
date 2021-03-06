#About 

Wouldn't it be nice if you didn't have to watch [this really helpful tutorial](http://railscasts.com/episodes/257-request-specs-and-capybara) on how to set up. 

Why this setup?  

Imagine that your rails app is a Rube Goldberg machine. In order for a Rube Goldberg machine to work, you need to make sure that 

1. All of the individual parts work
2. when you hook them all together, all of the combinations work. 

You can test things to make sure they work.  

1. Unit tests test individual parts of the Rube Goldberg machine.
2. Integration tests tests that all of the individual combinations of parts still work together. 

With this testing setup, 
1. Rspec lets you unit test the individual parts of your application.
2. Capybara and Selinium let you pretend to be a user and click through your web app, so that you can test that the combination of parts still work together. 

##Why you should use this setup
  1. You want to dive right into coding without tedious setup.
  2. You have a lot of javascript and you want to actually click through it like a user would. 

##Why you shouldn't use this setup
  1. Doing integration tests with selinium is really really slow. Why?  Because selinium has to open firefox and actually click through your app to test it.  Doing integration tests with selinium is like building a house out of brick and wood. It takes awhile. Normally, you do your integeration tests with just capybara.  Capybara is like pitching a tent.  It only takes a couple of minutes.  

#Setup: 

This assumes you have a Mac with OSX like I do. 

1. Clone the repository

2. In the project directory, on the console, type 
    ```bash
       rspec
    ```
     You will run into the following error:  

   ```bash 
       in `initialize': FATAL:  database "my_keyboards_test" does not exist (PG::ConnectionBad)
   ```
3. That is your cue to run the command 

    ```bash
        rake db:create
    ```
    
    This creates your database. 

4. Run rspec again.  You will see the following error:  
    ```
        `check_pending!': Migrations are pending; run 'bin/rake db:migrate RAILS_ENV=test' to resolve this issue. (ActiveRecord::PendingMigrationError)
    ```
    This means that you have a database, but the database is not set up. 

5. Do what it says, and run 

    ```bash
        bin/rake db:migrate RAILS_ENV=test
    ```
6. Then run rspec again.  You may see one final error:
   ```bash
     Selenium::WebDriver::Error::WebDriverError:
       Could not find Firefox binary (os=macosx). Make sure Firefox is installed or set the path manually with Selenium::WebDriver::Firefox::Binary.path=
    ```

This means you need to install Firefox into your Applications Directory

After that, the example test suite will run and you have successfully set up this project! 
    

#How to contribute to this project

##if you are a contributer on this repo:

### Put an Issue in the Issue Tracker

We use the Github issue tracker as our Agile-style card board.  A card board is generally a whiteboard with a bunch of post-it notes on it. Each of those notes go in three columns:  The Todo column, the Doing column, and the Done column.  This project's board is the github issue tracker. Unclamed issues are 'Todos.' Claimed issues are 'Doings'  and closed issues are 'Dones.'

#### Issue format

The title is one of two formats:

    Feature: description of feature
    Bugfix: description of bugfix

Each issue must be a user story.  We use the following user story format:  

    "As a <role>, I want <goal/desire> so that <benefit>"
    
For example, 

    "As a developer, I want there to be a how to contribute section of the Readme, so that I know how to contribute to the project." 


Each issue must also contain a description of what 'done' means for that feature or bugfix.  For example, 

    "the 'how to contribute' section is complete when 
       1. there is a specific outline of how one can claim units of work
       2. A descript of the preferred format for letting the other contributers know when you have claimed something.

Once you are done writing up the issue, feel free to claim it. 


##If you have forked this repo and want to make a contribution: 

###submit a pull request.  See the format for 'issues.'  Make sure your pull request follows that format. 




# Git: Working with Teams

## A friendly reminder to make your teammates like you:  
   1. NEVER merge your own pull requests.  Get a review. 
   2. Commit early and often. 
   3. Don't push to master. 

Git is a distributed version control system. Every Git working directory is a full-fledged repository with complete history and full version tracking capabilities, not dependent on network access or a central server.

## Getting Started

### Creating a repo on your machine

    $ git init

### Creating a .gitignore

By default git will try to track every file that exists in the working copy. Sometimes you'll have files that you don't want git to track, e.g. log files, OS files, etc. By creating a .gitignore file you can tell git that it should happily ignore these types of files. For more info: https://help.github.com/articles/ignoring-files

### Creating a README

A README file helps communicate the intent of the project to people who later discover the project and want a higher level view of what it's about.

## A Typical Development Workflow

One of the best features of git is that it allows you to forget that you are using source control while you are focused on development. Once you have some work to be put into source control it provides powerful tools to help you create a nice, curated set of commits that reflect the work you've done. The following is a typical workflow for using git:

    git status
    git diff
    git add -u -p .
    git diff --cached
    git commit -v
    
Let's walk through this step by step.

1. `git status` allows you to see which files you've modified.
2. `git diff` allows you to view a list of the modifications made to each file. Review the diff to make sure you haven't made any unintended changes.
3. `git add -u -p .` allows you to pick which modifications you would like to add to the commit. You can omit the `-p` if you want to commit all the files that were modified in the `git status` command. Similarly, you can omit the `-u` if you have only made additive changes (ie. you didn't delete a file from the working directory).
4. `git diff --cached` allows you to see the modifications that are currently waiting to be committed (ie. the contents of the git staging area).
5. `git commit -v` allows you to specify a commit message and review the modifications that will be part of the commit.

## Branches

One of the other powerful features of git is it's branching mechanism. A branch in git is used to develop code independent from master, which is also a branch. The simplicity and ease of switching between branches in git is what makes it so incredibly powerful. As a result most developers choose to write most of their work outside of the master branch. This enables them to quickly switch tasks and work on different features in the same respository without having to juggle which commits make it into the master branch.

### Creating a new branch

    git checkout -b my-feature

This will create a new branch, named `my-feature`, starting from the current branch. It will also change your current branch to the new branch. You usually want to start branches from the master branch.

### Changing to an existing branch

    git checkout my-other-feature

This will change your working copy to reflect the contents of the `my-other-feature` branch. You should always change branches when your working copy is clean, ie. there are no modifications to files in the repository. You can verify this by running `git status`, which should report no outstanding changes.

## Remotes

We said earlier that git is a *distributed* version control system. At the heart of this is the concept of remote repositories. A remote repository is a git repository that exists on another machine. When we're working on teams we are able to share code among our various development repositories by syncing with a shared remote repository. Github is a popular service that offers hosting for git repositories, and also adds a number of really nice features for working on software as a group. Here's how to get started with using Github as a remote for your existing local repository:

### Github repository set up

Create a new repository on Github (https://help.github.com/articles/create-a-repo). Github will give you a url, so that you can access the the repository on Github from other repositories. Then do the following in your local repository:

    git remote add origin https://url-from-github
    git push -u origin master

1. `$ git remote add origin https://url-from-github` this tells your local git repository that there is a remote repository that we'll call `origin` and lives at `https://url-from-github`.
2. `$ git push -u origin master` this command will push a copy of our `master` branch to the remote named `origin` (ie. Github in our case), and the `-u` tells git that our master branch should be setup to track the master branch on origin. You can omit the `-u` on future pushes because our master branch will still be tracking origin/master.

### Set up a local repository from an existing Github repository

    git clone https://url-from-github project-name

This will download a copy of the repository that lives at `https://url-from-github` and put it into a directory called `project-name` in your current directory. You can omit the `project-name` parameter if you want to use the same name as the remote repository in your local repository.

### Push a branch to a remote

    git push origin -u <local-branch-name>:<remote-branch-name>
    
This is the full push command. It pushes the local-branch-name to origin, renaming it to remote-branch-name. It also sets up our local branch to track the remote branch. A shorter form is:

    git push origin <local-branch-name>

Without specifying a remote branch name, git assumes that it should name the remote branch the same name as your local branch. If you've previously set up tracking on this branch, git will push to the remote branch that local branch is tracking.

## Collaboration

In the course of collaborating with other developers, you'll likely want to get the changes that they've made into your own local repository. This is where most of the headaches of working with git (and other developers) come from.

So, let's say that a teammate has pushed some changes that she made into the `master` branch of our remote repository. We'd like to get the changes into our local repository and then use them in the branch we're working in (let's call it `my-feature`).

    $ git checkout master
    $ git fetch origin
    $ git rebase origin/master
    $ git checkout my-feature
    $ git rebase master
    
1. `$ git checkout master` switch into the local master branch
2. `$ git fetch origin` will fetch all of the changes that have been made to the remote repository. This only downloads the changes, it doesn't merge them into our local repo, though.
3. `$ git rebase origin/master` in the previous step we fetched all the changes from origin, git now has references to the various branches from origin in the form of "<remote-name>/<remote-branch-name>". In this command we're telling git to rebase our current branch to start from origin's master branch. This effectively pulls in the changes from the origin to our branch.
4. `$ git checkout my-feature` now switch back to our feature branch
5. `$ git rebase master` and rebase it to our master branch, which now has the changes from origin/master from step 3.
    
Issue a pull request (https://help.github.com/articles/creating-a-pull-request) and
solicit feedback from your team. Once approved, merge the pull request
(https://help.github.com/articles/merging-a-pull-request). This will merge your
feature with master on the origin, which puts your master out of date.
Update your copy of master
$ git fetch origin$ git rebase origin/master

## Keeping git clean - Removing dead branches

In the process of working in branches and merging pull requests, your local and remote repositories will build up branches that have already been merged, and are no longer needed. A dirty remote or local repository will slow you and your team down, as your repository is at the heart of communication about the state of the code (ie. what is in progress).

Removing branches locally:

    $ git branch -d my-feature
    
Sometimes you'll need to use `-D` instead of `-d`. `-D` is just a more dangerous form of the same method.

Removing branches from remote repositories:

    $ git push origin :my_feature

You'll notice that this looks a lot like the normal push command:
    
    git push origin local-branch-name:remote-branch-name

That's because it _is_ the same command. In this case we just specify an "empty" branch for the local branch. This has the effect of pushing an empty branch to the repote repository, thus overwriting remote branch contents with an empty branch.

Removing dead references from your local repository:

    $ git remote prune origin
    
When you fetch/pull from a remote, your local repository will download references to all the branches the remote knows about. When a branch is removed from the remote, your local repository will still be holding onto a reference, even though the branch is now dead and gone. It's a good idea to periodically prune your local references using this command. This will remove all references that no longer exist on the given remote.
