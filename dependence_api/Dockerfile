FROM openjdk:11.0.2-jdk-slim-stretch

WORKDIR workspace

COPY build/distributions/ .

#RUN tar -xvf playBinary.zip
RUN unzip /workspace/playBinary.zip -d /workspace

ENTRYPOINT sh playBinary/bin/playBinary
#ENTRYPOINT sleep 10000
