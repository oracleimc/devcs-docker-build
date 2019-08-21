# Copies in our code and runs NPM Install
FROM node:latest as builder
WORKDIR /usr/src/app
COPY .eslintrc.yml ./
COPY webpack.config.js ./
COPY .gitignore ./
COPY package* ./
COPY src/ src/
RUN ["npm", "install"]
RUN ["npm", "run", "build"]
# Lints Code
FROM node:latest as linting
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/ .
RUN ["npm", "run", "lint"]
# Gets Sonarqube Scanner from Dockerhub and runs it
FROM newtmitch/sonar-scanner:latest as sonarqube
COPY --from=builder /usr/src/app/src /root/src
# Runs Unit Tests
FROM node:latest as unit-tests
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/ .
COPY test ./test
RUN ["npm", "test"]
# Starts and Serves Web Page
FROM node:latest as serve
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/dist ./dist
COPY --from=builder /usr/src/app/package* ./
ENV PORT=80
CMD ["npm", "start"]