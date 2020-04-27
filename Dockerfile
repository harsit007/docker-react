#Prod ready for Node & React
#Specify base image
FROM node:alpine as builder
#Work dir
WORKDIR '/app'
#Copy the package json file
COPY ./package.json ./
#Install dependecy
RUN npm install
#Straight copy
COPY . .
#Build phase
RUN ["npm", "run", "build"]


FROM nginx
#Copy from different phase --from named builder source destination
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
#Deafult port : 80