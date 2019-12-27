# More setup information

## Apache manually actions

### Avoid ServerName Error
> apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.0.1 for ServerName
1. /etc/hosts and /etc/hostname host name should be identical
2. in /etc/hosts must like:"
```conf
	127.0.0.1 localhost"
	192.168.1.81 <hostname>.<domain_name> <host_name>
```

### Enable Apache HTTPS
```bash
a2enmod ssl
a2ensite default-ssl
```
> See ./Https.md

## More patches

### apache-module.fcgid.conf.patch
> Adjust fcgid timeout and buffer settings

### patchs/apache.conf.patch
> Adjust Timeout and ProxyTimeout settings

### patchs/pool-www.conf.patch
> Adjust php-fpm performance
```patch
-;listen.backlog = 65535
+listen.backlog = 1024
```

### Use http proxy

* More compatible with old php5 code.
* patchs/apache.default.proxy.patch
* patchs/pool-www.conf.patch

