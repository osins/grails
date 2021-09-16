# Install dependencies only when needed
FROM openjdk:8u302-slim-buster

RUN apt update && apt install -y bash unzip zip curl wget

RUN wget https://github.com/grails/grails-core/releases/download/v2.3.8/grails-2.3.8.zip && unzip grails-2.3.8.zip

# # Set Default Behavior
# ENTRYPOINT ["grails"]
# CMD ["run-app"]
