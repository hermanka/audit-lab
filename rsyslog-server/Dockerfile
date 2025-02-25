FROM alpine:3.21


RUN apk update && \
    apk add --no-cache tini rsyslog sudo nano

COPY ./rsyslog.conf /etc/rsyslog.conf

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["rsyslogd","-n"]

