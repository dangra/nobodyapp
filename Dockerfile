FROM alpine:latest
USER nobody
ADD init.sh /
CMD ["/init.sh"]
