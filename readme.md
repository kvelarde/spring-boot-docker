Follow the instructions to build and run the app using Docker.

Building the app

`docker build -t hello-world-boot .`


Running the app

`docker run -p 8080:8080 --name=springboot hello-world-boot`

Accessing the app

`http://localhost:8080`
