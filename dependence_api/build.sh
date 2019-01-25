VERSION="latest"
echo $VERSION

gradle wrapper

./gradlew clean playBinary idea dist

docker build -t dependence_api .

#docker run --rm -d -p 8300:80 dependence_api:$VERSION