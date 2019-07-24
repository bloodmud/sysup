# Use github repo

## Config git
* Account/User information

		git config --global user.name "bloodmud"
		git config --global user.email "bloodmud@gmail.com"

* Default push behavior

		git config --global push.default simple

* Caching password
	> https://help.github.com/articles/caching-your-github-password-in-git/

		git config --global credential.helper cache
		git config --global credential.helper "cache --timeout=3600"

* Merge tool

		git config --global merge.tool meld

## Cretae new repo
> login first, then
> https://github.com/new

## Quick setup repo

* create a new repository on the command line

		echo "# sysup" >> README.md
		git init
		git add README.md
		git commit -m "first commit"
		git remote add origin https://github.com/bloodmud/sysup.git
		git push -u origin master

* …or push an existing repository from the command line

		git remote add origin https://github.com/bloodmud/sysup.git
		git push -u origin master

* …or import code from another repository

		You can initialize this repository with code from a Subversion, Mercurial, or TFS project.

## Repo opration

> https://help.github.com/articles/which-remote-url-should-i-use/

### HTTPS [RECOMMAND]
* Clone
		git clone https://github.com/bloodmud/<repo_name>

* Push
> do it, follow instructions ...

		git push

* Add / Commit / Pull
	> NO difference

### SSH
* Test connection
	1. config .ssh/config

			Host github
				HostName ssh.github.com
				Port 443
				User git
				IdentityFile /home/bloodmud/.ssh/bloodmud

	2. Test

			$ ssh -T github

* Oprate repop: use github desktop
	> Only for OS X and Windows

