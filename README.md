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
