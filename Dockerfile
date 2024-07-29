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
