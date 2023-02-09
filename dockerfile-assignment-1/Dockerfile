# use this empty Dockerfile to build your assignment
FROM node:6-alpine
# NOTE: The instructions are now in the README.md file in this directory.
# This will be listening on port 3000 but we should run  on host at 80
EXPOSE 3000
RUN apk add --no-cache tini
WORKDIR /usr/src/app

COPY . .

RUN npm install && npm cache clean --force

CMD [ "/sbin/tini", "--", "node", "./bin/www"]