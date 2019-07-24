# Important options

## SSH & SCP

* Port
		ssh -p
		scp -P

* Identity_file (private key file)
		ssh -i <file_path_name>
		scp -i <file_path_name>

## SSH Config

* Config file: ~/.ssh/config
* Config options: @see 'man ssh_config'
* Common options:
	* *Host*: alias for connection
	* *HostName*: hostname for server
	* *User*: username for conenctiton
	* *Port*: port number for custom
	* *IdentityFile*: rsa key file path
* Examples:

		Host git-devsrv
			HostName devsrv
			User git
			IdentityFile /home/bloodmud/.ssh/bloodmud
		
		Host bloodmud-devsrv
			HostName devsrv
			User bloodmud
			IdentityFile /home/bloodmud/.ssh/bloodmud

* Usage examples:
		ssh git-devsrv
		scp bloodmud-devsrv:~/filename .

## Gitolite

* Use config file
* Examples:
		git clone git-devsrv:project-name

# Gitolite administration

* Prepare
	1. Use a separate account
	2. Move gitolite (private key file) to ~/.ssh/id_rsa

		> git clone git@devsrv:gitolite-admin
	
* Add repo and setup access
	1. Edit conf/gitolite.conf

		> add repo

	2. Copy user public keys to keydir

		> name.pub

	3. Add public keys to repo and commit

		> git add conf
		> git add keydir
		> git commit -m "Init repo and user access"
		> git push
