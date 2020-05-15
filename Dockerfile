FROM oracle/graalvm-ce:20.0.0-java8 as graalvm
# For JDK 11
#FROM oracle/graalvm-ce:20.0.0-java11 as graalvm
RUN gu install native-image

COPY . /home/app/mn-docker-env-test
WORKDIR /home/app/mn-docker-env-test

RUN native-image --no-server -cp build/libs/mn-docker-env-test-*-all.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/mn-docker-env-test/mn-docker-env-test /app/mn-docker-env-test
ENTRYPOINT ["/app/mn-docker-env-test"]
