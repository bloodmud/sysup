## Gitolite3

### Server user

```bash
# name: gitolite3
# home: /var/lib/gitolite3
su - gitolite3
```

### Client config .ssh/config

```conf
Host gitolite3-eleway
	HostName 120.79.0.82
	Port 22
	User gitolite3
	IdentityFile /Users/bloodmud/.ssh/bloodmud
```

## Gitolite3 Repo 

### Clone admin repo
```bash
git clone gitolite3-eleway:gitolite-admin
```

### Add repo and setup access

1. Edit conf/gitolite.conf to ***add repo***


2. Copy user public keys to ***keydir***


3. Add public keys to repo and commit

```bash
git add conf
git add keydir
git commit -m "Init repo and user access"
git push
```
