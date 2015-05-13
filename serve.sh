# This assumes that you are running on mac osx
# This will start up a detached docker container, that will serve our presentation
# via Grunt. It will be mounted to the current slideshow directory, and
# will be served on $(boot2docker ip):8000
docker run -d -v $(pwd):/slides/ -p 8000:8000 "danidemi/docker-reveal.js:latest"

# To view the docker container that was started do:
# $ docker ps

# To view the logs of the docker container, do:
# $ docker logs <container_id>

# To kill the container that was started do:
# $ docker kill <container_id>