FROM openjdk:8
ADD target/dhbwplan.war dhbwplan.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","dhbwplan.war"]