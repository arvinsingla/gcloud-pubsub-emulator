FROM google/cloud-sdk:alpine

RUN apk --update add openjdk8-jre
RUN gcloud components install --quiet beta pubsub-emulator
RUN mkdir -p /var/pubsub

EXPOSE 8085

CMD [ "gcloud", "beta", "emulators", "pubsub", "start", "--data-dir=/var/pubsub", "--log-http", "--verbosity=debug", "--host-port=0.0.0.0:8085", "--user-output-enabled" ]
