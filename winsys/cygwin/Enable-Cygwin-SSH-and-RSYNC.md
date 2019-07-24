1. Install [cygwin](https://cygwin.com/setup-x86_64.exe) rsync
> Minimum needs:
>	openssh
>	rsync
>	git (~)
>	vim (gvim: windows version is better)

2. Setup ssh host
`
ssh-host-config
`
> YES!

3. Start sshd service
`
cygrunsrv -S sshd
`
> Stop: cygrunsrv -E sshd

4. Add windows firewall rule
> OpenSSH 22, Allow connect

5. Add user to login with
`
mkpasswd -l -u <WINDOWS_LOCAL_USER_NAME> >> /etc/passwd
`

6. Setup be authenticated by ***Key pair***
`
cp <USER_PUB_KEY_FILE> ~/.ssh/authorized_keys
`
`
#or with multiple key pair
cat <USER_PUB_KEY_FILE> >> ~/.ssh/authorized_keys
`

7. DONE!
