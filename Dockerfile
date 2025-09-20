#use a go base image
FROM golang:1.25-alpine

#install air
RUN go install github.com/air-verse/air@latest

#set the working dir
WORKDIR /app

#copy go.mod and go.sum to cache dependencies
COPY go.mod go.sum ./

#download dependencies
RUN go mod download

#copy the rest of the application
COPY . .

#Expose the port
EXPOSE 5000

#Start the application withh air for live reloading
CMD ["air"]