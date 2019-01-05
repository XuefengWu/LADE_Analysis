FROM openjdk:8-jre-alpine

WORKDIR workspace

COPY build/distributions/ .

#RUN tar -xvf playBinary.zip
RUN unzip /workspace/playBinary.zip -d /workspace

ENTRYPOINT sh playBinary/bin/playBinary
#ENTRYPOINT sleep 10000
