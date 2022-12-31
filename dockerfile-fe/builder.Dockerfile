FROM node:13.12.0-alpine as builder
#--build-arg
ARG BRANCH

# set working directory
WORKDIR /app

# add app
COPY . ./
#set env file
COPY .env.${BRANCH} .env
##RUN yarn install
##RUN yarn build
RUN npm install
RUN npm run build