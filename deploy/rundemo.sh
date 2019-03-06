cd ..
mkdir -p demo
cd demo
if [ ! -f spring-framework.zip ]; then
    wget https://github.com/spring-projects/spring-framework/archive/master.zip
    mv master.zip spring-framework.zip
    unzip spring-framework.zip
fi

cd spring-framework-master
gradle  compileJava compileKotlin
cd ../..

CURRENT=`pwd`
java -jar scan_java_bytecode/target/scan_java_bytecode-1.0-jar-with-dependencies.jar $CURRENT"/demo/spring-framework-master"