# Build stage
#FROM maven:latest AS appserver
#WORKDIR /usr/src/app
#COPY pom.xml .
##RUN mvn -B -f pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
#COPY . .
#RUN mvn -B -s /usr/share/maven/ref/settings-docker.xml -Dmaven.test.failure.ignore=false install -Dcobertura.branchrate=50 -Dcobertura.linerate=50

## Final Stage
#FROM java:8-jdk-alpine
#WORKDIR /app
#COPY --from=appserver /usr/src/app/target/springboot-1.jar .
#ENTRYPOINT ["java","-jar","/app/springboot-1.jar"]



# Build stage
FROM maven:latest
WORKDIR /usr/src/app
COPY pom.xml .
#RUN mvn -B -f pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
COPY . .
RUN mvn -B -s /usr/share/maven/ref/settings-docker.xml -Dmaven.test.failure.ignore=false install -Dcobertura.branchrate=50 -Dcobertura.linerate=50


ENTRYPOINT ["java","-jar","/usr/src/app/target/springboot-1.jar"]