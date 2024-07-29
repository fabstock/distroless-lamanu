### TP CI/CD

 - docker build  -t  nodeapp:0.0.1-manu  ./ 

 - docker run -p 3000:3000  --rm   --name nodeapp1  -it -d    nodeapp:0.0.1-manu
 
```shell

# Stage 1
FROM node:20.16-alpine AS base
ENV NODE_ENV production

RUN mkdir -p /app
WORKDIR /app
COPY ./app/*.*  /app/


EXPOSE 3000

#RUN npm install --production
RUN npm install --production --omit-dev

CMD ["node","server.js"]


```

- tag image 

```
localhost [~/LAMANU/CICD/distroless]$ docker tag  nodeapp:0.0.1-manu  fabstock2/nodeapp:0.0.1-manu
```

- login to hub docker 

```
localhost [~/LAMANU/CICD/distroless]$ docker login
Authenticating with existing credentials...
WARNING! Your password will be stored unencrypted in /home/fab/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```


- push image to docker hub 

```

localhost [~/LAMANU/CICD/distroless]$ docker push fabstock2/nodeapp:0.0.1-manu
The push refers to repository [docker.io/fabstock2/nodeapp]
31c2e9a85fa7: Pushed
f67e5b55f9e3: Pushed
e4f182ff5c61: Pushed
364f90d01431: Mounted from library/node
d21971417e92: Mounted from library/node
aba337309a79: Mounted from library/node
78561cef0761: Mounted from library/node
0.0.1-manu: digest: sha256:5324ca68dec360cb62296c91ad60f2cf5c58c4ebe0df3617e46023f339613a22 size: 1783

```





