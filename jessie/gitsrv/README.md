## Jessie - Git Server
> Debian Jessie (8) git server system setup
> @see https://github.com/sitaramc/gitolite

## Common install steps

1. Update sources.list, install common tools

	bash 00-sysbase.sh

2. Update vim and root vim config

	cd ../user
	bash 00-init-root.sh

3. (optional/recommend) reboot

4. (optional) Install gitolite from source

	cd gitsrv
	bash 01-setup-gitolite.sh
	# then follow instructions

5. Cleanup

	bash 99-post-check.sh



