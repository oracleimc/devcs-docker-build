# Hello World Sample Project

This project is to create a simple web app, responding with Hello World.
This includes the following:
- Node.js Web App (Express)
- Node.js Unit Tests (Mocha, Chai)
- Docker file
- ESLint config

# Prerequities
- **Node.js** is required to run locally (without docker having it running)
- **Docker is** required to build & run docker images and containers

# Installation 
1. Clone this repository
2. Execute `npm i` within the folder 


# npm scripts
Common usages are entered within [package.json](./package.json)

## Run unit tests
Unit tests are based on [mocha](https://mochajs.org) and [chai](https://www.chaijs.com)
```shell
npm test
```

## Run lint
[ESLint](https://eslint.org) is used coding standarts and syntax errors
```shell
npm run lint
```

## Build
[Webpack](https://webpack.js.org) is used to bundle the JS. This bundle output is used in actual run-time
```shell
npm run build
```

## Start
Start run the http server at local port 3000. If environment variable `PORT` is set, that value is used
```shell
npm start
```

# Docker
Docker is configured to execute build, tests and distributable packaging. [Multi-Stage Builds](https://medium.com/capital-one-tech/multi-stage-builds-and-dockerfile-b5866d9e2f84) are used to create the optimal output without any artifacts remain within the final package

## Docker scripts
Docker related scripts are locaged under [scripts/docker](./scripts/docker) folder

## Build steps
Steps can be categorized into the following sections

### Builder
npm install and webpack bundling is executed. The other containers are using output of this container.

### Tests
Docker file executes the following tests in order:
1. Lint
2. Security analysis by [Sonarqube](https://www.sonarqube.org)
3. Unit tests

If the tests are failing, it will not continute, there will be no output

### Output
If you are using the scripts, the output is labeled as `emeaccoe/helloworld`. Feel free to change it within the scripts.
