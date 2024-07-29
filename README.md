### TP CI/CD



 - docker build -t source-app:0.0.1-lamanu  ./
 - docker tag source-app:0.0.1-lamanu   fabstock2/source-app:0.0.1-lamanu
 - docker push  fabstock2/source-app:0.0.1-lamanu
 - docker run  --rm --name node  -d  -p 3000:3000     fabstock2/source-app:0.0.1-lamanu


 
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

