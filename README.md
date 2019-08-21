# Hello World Sample Project

This project is to create a simple web app, responding with Hello World.
This includes the following:
- Node.js Web App (Express)
- Node.js Unit Tests (Mocha, Chai)
- Docker file

# Prerequities
- **Node.js** is required to run locally (without docker having it running)
- **Docker is** required to build & run docker images and containers

# Installation 
1. Clone this repository
2. Execute `npm i` within the folder 

# Scripts
Shell scripts are located within scripts folder. Scripts are groupped in sub-folders by their purpose

## Docker Scripts
There are two ways of building the docker
- production (prod)
- development (dev)

Each script has it specified wihch purpose it is working with.

### Build
Build generates images. Both of them are using the same _dockerfile_
- **production**: Generates `emeaccoe/helloworld:production` and tags the same with   `emeaccoe/helloworld:latest` (latest is the default). This build is size optimized. Does not execute unit tests
- **development**: Generates `emeaccoe/helloworld:development` with executing unit tests

### Run
For each purpose there are different run commands.
- **production** listens on TCP/8080, has name as `hellworld-prod`
- **development** listens on TCP/8081, has name as `hellworld-dev`

Based on your need, it is possible to run them attached or deattached

### rm
Removes the container (stops if it is already running)