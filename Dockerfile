# Stage 1
FROM node:20.16-alpine AS build
#ENV NODE_ENV development
ENV NODE_ENV production
WORKDIR /source-app/

RUN apk update && apk --no-cache add curl tar

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
