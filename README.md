# LADE_Analysis
analysis system architecture.
such as JArchitect and Structure 101
visit [https://github.com/Awesome-LADE/awesome-LADE] find more similar tools.

# Prepare:
```
JDK 8
maven 3+
gradle
docker
docker-compose
wget
```

# build and run
```
cd deploy
sh buildall.sh
docker-compose up
```

you can visit http://localhost:8300/
and find nothing now.

# run demo
```
cd deploy
sh rundemo.sh
```
it will download spring-framework source code and scan,
after about 30 minitues you can visit 
http://localhost:8300/method/org.springframework.web.reactive.DispatcherHandler/handle/invokes

and should find something.

# features
- module to module method relations 
    /method_method/spring-webflux_spring-web_invokes
- class dependence
    /class/org.springframework.web.reactive.DispatcherHandler/dependences
- method invokes
    /method/org.springframework.web.reactive.DispatcherHandler/handle/invokes

- mark node color
    right now need insert configure into database
    INSERT INTO Configure VALUES  ("8cd92f65-3083-4c0c-9506-55f1716d5127","nodecolor","server","#d3d7e8","2019-01-05 11:30:09","2019-01-05 11:30:09");
    INSERT INTO Configure VALUES  ("8cd92f65-3083-4c0c-9506-55f1716d5129","nodecolor","reactive","#40e0d0","2019-01-05 11:30:09","2019-01-05 11:30:09");