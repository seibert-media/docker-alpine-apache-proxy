# alpine-apache-proxy

Alpine based system with apache as reverse proxy.

## Getting started

Start Confluence or other webapplication:
```
docker run -d --name confluence seibertmedia/atlassian-confluence
```

Start and link Apache reverse proxy:
```
docker run -d --name apache -v $(pwd)/apache:/etc/apache2/vhost.d -p 80:80 --link confluence:confluence seibertmedia/alpine-apache-proxy
```
