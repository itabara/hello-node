# use a node base image
FROM node:a8.2.1-alpine

# set maintainer
LABEL maintainer "iulian.tabara@gmail.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000