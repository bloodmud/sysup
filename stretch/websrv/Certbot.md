## Install
> @see https://certbot.eff.org

```bash
# apache
apt-get install python-certbot python-certbot-apache -y
# nginx
apt-get install python-certbot python-certbot-nginx -y
```

## Config - Apache

* Enable
```bash
# sample
certbot --apache 

# advance
certbot --authenticator webroot --installer apache --webroot-path /var/www/html/yousite -d yousite.org -d www.yousite.org
```

* Cron
```conf
CRON: 5 2 1 * * /usr/bin/certbot renew
```

## CHECK HTTPS(SSL) CONFIGURATION

```bash
# Get a report from https://www.ssllabs.com/ssltest/analyze.html
# Example
https://www.ssllabs.com/ssltest/analyze.html?d=yousite.org&latest
```
