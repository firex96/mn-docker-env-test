#!/bin/sh
docker build . -t mn-docker-env-test
echo
echo
echo "To run the docker container execute:"
echo "    $ docker run -p 8080:8080 mn-docker-env-test"
