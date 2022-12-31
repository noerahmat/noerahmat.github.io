ARG PROJECT
FROM registry01.loyalto.id/${PROJECT}:builder as builder
##FROM node:13.12.0-alpine as builder
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
RUN npm run build:${BRANCH}

#base image
FROM nginx:1.14.2-alpine
ARG BRANCH
ARG PORT
#set working directory
WORKDIR /usr/share/nginx/html/
#copy build source
COPY --from=builder /app/build/ ./
#set env file
COPY .env.${BRANCH} .env
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE ${PORT}

CMD ["nginx", "-g", "daemon off;"]