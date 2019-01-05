VERSION="v0.7.0"
echo $VERSION

gradle clean playBinary idea dist

docker build -t dependence_api .

#docker run --rm -d -p 8300:80 dependence_api:$VERSION