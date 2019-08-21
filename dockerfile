FROM node
RUN mkdir /app
COPY *.js /app/
COPY *.json /app/
COPY test /app/test/
ARG BUILD_MODE=development
ENV PORT=80
WORKDIR /app
#RUN if [ "x$arg" = "x" ] ; then echo Argument not provided ; else echo Argument is $arg ; fi
RUN RED='\033[0;31m'; NC='\033[0m'; YELLOW='\033[1;33m'; echo "\n\n${YELLOW}BUILD_MODE${NC}=${RED}${BUILD_MODE}${NC}\n\n"
RUN if [ "$BUILD_MODE" = "production" ] ;\
    then \
        rm -rf test && \
        npm i --production ;\
    else \
        npm i ;\
    fi
RUN if [ "$BUILD_MODE" != "production" ] ;\
    then \
        npm run test ;\
    fi

CMD ["npm", "run", "start"]
