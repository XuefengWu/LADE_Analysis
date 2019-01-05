# Analysis Java Dependence
 
#Setup analysis java server 
```
docker build -t analysis_java -f src/main/docker/Dockerfile .
docker-compose up
```

#Useage 
the server is running
```
GET http://localhost:8080/greet/world
```

analysis API
```
POST http://localhost:8080/analysis/class/{class}
POST http://localhost:8080/analysis/package/{package}
```

#run java
```commandline
mvn package
java -cp dependencies_java-1.0-jar-with-dependencies.jar evolution.example.ParsePackageClientDemo ~/project_code_src
```