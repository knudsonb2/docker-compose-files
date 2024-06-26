---
version: "2"
services:
  chevereto:
    image: lscr.io/linuxserver/chevereto
    container_name: chevereto
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Los_Angeles
    volumes:
      - /srv/dockerdata/cheverato/config:/config
      - /path/to/data:/data
    ports:
      - 80:80
      - 443:443
    restart: unless-stopped
    depends_on:
      - chevereto-db

  chevereto-db:
    image: lscr.io/linuxserver/mariadb
    container_name: chevereto-db
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Los_Angeles
      - MYSQL_ROOT_PASSWORD=JesusIsLord(2018)
      - MYSQL_DATABASE=chevereto
      - MYSQL_USER=chevereto
      - MYSQL_PASSWORD=JesusIsLord(2018)
    volumes:
      - /srv/dockerdata/cheverato_database/config:/config
    restart: unless-stopped