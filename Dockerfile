FROM node:10.13-alpine
ENV NODE_ENV production
WORKDIR /usr/src/app
ADD "package.json" .
ADD "package-lock.json" .
RUN npm install
ADD . .
EXPOSE 80
CMD npm start