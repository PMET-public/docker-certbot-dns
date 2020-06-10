FROM python:3.8-slim AS stage1

RUN pip3 install \
  certbot-dns-cloudflare \
  certbot-dns-cloudxns \
  certbot-dns-digitalocean \
  certbot-dns-dnsimple \
  certbot-dns-dnsmadeeasy \
  # certbot-dns-google \
  certbot-dns-linode \
  certbot-dns-luadns \
  certbot-dns-nsone \
  certbot-dns-ovh \
  certbot-dns-rfc2136 \
  certbot-dns-route53

FROM python:3.8-slim

COPY --from=stage1 /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY --from=stage1 /usr/local/bin/certbot /usr/local/bin/certbot

ENTRYPOINT ["certbot", "certonly", "--register-unsafely-without-email", "--agree-tos"]