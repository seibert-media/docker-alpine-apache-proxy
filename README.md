# alpine-apache-proxy

Alpine based system with apache as reverse proxy.

## Getting started

Start Confluence or other web application:
```
docker run -d --name confluence seibertmedia/atlassian-confluence
```

Copy and adjust Apache configuration:
```
cd apache
cp confluence.conf.example confluence.conf
vi confluence.conf
```

Start and link Apache reverse proxy:
```
docker run -d --name apache -v $(pwd)/apache:/etc/apache2/vhost.d -p 80:80 --link confluence:confluence seibertmedia/alpine-apache-proxy
```
