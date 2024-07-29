### TP CI/CD



 - docker build -t source-app:0.0.1-lamanu  ./
 - docker tag source-app:0.0.1-lamanu   fabstock2/source-app:0.0.1-lamanu
 - docker push  fabstock2/source-app:0.0.1-lamanu
 - docker run  --rm --name node  -d  -p 3000:3000     fabstock2/source-app:0.0.1-lamanu
 - docker run -p 3000:3000    --name node -ti  -v $(pwd)/source-app:/source-app   --rm    fabstock2/source-app:0.0.1-lamanu  src/index.js


 - Dockerfile


 ```shell 
# Stage 1
FROM node:20.16-alpine AS build
#ENV NODE_ENV development
ENV NODE_ENV production
WORKDIR /source-app/

RUN apk update && apk add curl

RUN mkdir -p /source-app

#ADD ./source-app  ./

#COPY ./source-app/package.js .

FROM build

COPY --from=build /source-app .

EXPOSE 3000


RUN sh -c "ls -altr && pwd"
RUN sh -c "node --version"
#&& npm install
#--production
#RUN npm install --production --omit=dev
#CMD ["node","/source-app/src/index.js"]
```

- old dockerfile 

 
```shell

# Stage 1
FROM node:20.16-alpine AS base
#ENV NODE_ENV development
ENV NODE_ENV production
WORKDIR /source-app/


RUN mkdir -p /source-app

ADD ./source-app  ./





EXPOSE 3000


RUN ls -altr && pwd && npm install
#--production
#RUN npm install --production --omit=dev
CMD ["node","/source-app/src/index.js"]


```

