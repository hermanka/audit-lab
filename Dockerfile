FROM yobasystems/alpine-mariadb

ENV USERNAME="user" \
    PASSWORD="Passw0rd" \
    SUDO_OK="true" \
    AUTOLOGIN="true" \
    TZ="Etc/UTC"

COPY ./entrypoint.sh /
COPY ./wrapper.sh /
COPY ./skel/ /etc/skel

RUN apk update && \
    apk add --no-cache tini bash ttyd tzdata sudo nano && \
    chmod +x /entrypoint.sh && \
    chmod -R a+rwX /var/lib/mysql && \
    touch /etc/.firstrun && \
    ln -s "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo $TZ > /etc/timezone
        
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/wrapper.sh"]

EXPOSE 7681/tcp 3306

# How to build n run
# docker build -t audit-lab-image .
