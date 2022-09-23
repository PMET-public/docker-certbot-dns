![Docker badge](https://github.com/PMET-public/docker-certbot-dns/workflows/build%20and%20publish%20to%20Docker%20Hub/badge.svg?branch=master)

# certbot-dns
Create TLS certs using certbot with DNS verification from any of the [supported plugins](https://certbot.eff.org/docs/using.html?highlight=dns#dns-plugins)

See plugins for the required syntax. For a DigitalOcean specific example, see below or the docker-compose file.

Clone and build your own images OR use `pmetpublic/certbot-dns`

```sh
docker run \
  -v $PWD/.dns-config.ini:/.dns-config.ini \
  -v $PWD/certs:/etc/letsencrypt/archive \
  pmetpublic/certbot-dns \
  --dns-digitalocean \
  --dns-digitalocean-credentials /.dns-config.ini \
  --dns-digitalocean-propagation-seconds 60 \
  -d '*.your-domain.com'
```
