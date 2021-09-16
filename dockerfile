# Install dependencies only when needed
FROM openjdk:8u302-slim-buster

RUN apt update && apt install -y bash unzip zip curl wget

WORKDIR /opt

RUN wget https://github.com/grails/grails-core/releases/download/v2.3.8/grails-2.3.8.zip && unzip grails-2.3.8.zip
RUN export GRAILS_HOME=/opt/grails-2.3.8 && export PATH=$GRAILS_HOME/bin:$PATH

# # Set Default Behavior
# ENTRYPOINT ["grails"]
# CMD ["run-app"]
