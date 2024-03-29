## Jessie
> Debian Jessie (8) server system setup

## Common install steps

1. Update sources.list, install common tools

	bash 00-sysbase.sh

2. Update vim and root vim config

	cd user
	bash 00-init-root.sh
	bash 01-init-user.sh

3. (optional/recommend) reboot

4. Install database, php-fpm, web server

	cd websrv
	bash 01-00-apache-php-fpm.sh # apche2

	* Enable HTTPS
	> @see websrv/HTTPS-README.md

5. (optional) Install gitolite from source

	cd gitsrv
	# user root
	bash 01-setup-gitolite.sh
	# user git
	bash install_from_source.sh

6. (optional) Install fish shell

	bash 05-fish-shell.sh

7. Cleanup

	bash 99-post-check.sh

## Make server more security
> @see after/aliyun-sshd_config.patch

1. !! NOTE: You must setup login by key file properly at first

2. Disable root user login by password

	PermitRootLogin without-password
	... ...
	#PasswordAuthentication yes

3. Enabale logging and other options

	SyslogFacility AUTH
	... ...
	# AcceptEnv LANG LC_*

> see also: 05-fish-shell.sh

## Enable HTTPS  —  Using Let’s Encrypt

* Basic
> https://letsencrypt.org/getting-started/

* CertBot

	* Apache
	> https://certbot.eff.org/#debianjessie-apache

