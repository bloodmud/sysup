## Jessie
> Debian Jessie (8) server system setup

## Common install steps

1. Update sources.list, install common tools

	cd jessie
	bash 00-sysbase.sh

2. Update vim and root vim config

	cd user/root
	bash update.sh

3. (optional/recommend) reboot

4. Install docker-engine

	bash ./01-setup-docker.sh

5. (optional) Install fish shell

	bash 05-fish-shell.sh

6. Cleanup

	bash 99-post-check.sh

