# Stage 1
FROM node:20.16-alpine AS base
#ENV NODE_ENV development
ENV NODE_ENV production
WORKDIR /source-app/


RUN mkdir -p /source-app

#ADD ./source-app  ./

#COPY ./source-app/package.js .




EXPOSE 3000


#RUN ls -altr && pwd && npm install 
#--production
#RUN npm install --production --omit=dev
#CMD ["node","/source-app/src/index.js"]
