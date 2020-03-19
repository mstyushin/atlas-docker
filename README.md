# Apache Atlas dockerized
This image provides a standalone Apache Atlas installation.

## Supported tags
* `release-1.1.0-rc2`

### Sample compose file:
```
version: '2.1'
services:
  atlas:
    image: mstyushin/atlas:release-1.1.0-rc2
    container_name: atlas
    build: .
    command: "/entrypoint.sh"
    expose:
      - "21000"
      - "5005"
    ports:
      - "21000:21000"
      - "5005:5005"
    environment:
      - JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
      - MAVEN_HOME=/usr/share/maven
      - PATH=/root/atlas-bin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
      - MANAGE_LOCAL_SOLR=true
      - MANAGE_LOCAL_HBASE=true
```

Run it as `docker-compose up -d` and you'll get your Atlas up&running at http://localhost:21000

### Useful links
Official documentation: https://atlas.apache.org
Apache Atlas source code repository: https://github.com/apache/atlas

