# Install dependencies only when needed
FROM openjdk:8u302-slim-buster

ENV http_proxy=http://192.168.3.32:1080
ENV https_proxy=http://192.168.3.32:1080

RUN apt-get update && apt-get install -y unzip zip curl wget

# Install Grails
RUN curl -s "https://get.sdkman.io" | bash

# RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install java $JAVA_VERSION" 
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install maven 3.8.2" 
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install groovy 2.1.9" 
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install gradle" 
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install grails 2.3.8" 
RUN /bin/bash -c "rm -rf $HOME/.sdkman/archives/* && rm -rf $HOME/.sdkman/tmp/* && rm -rf /opt/sdkman && rm -rf /tmp/*"

# Defining default non-root user UID, GID, and name 
ARG USER_UID="1000"
ARG USER_GID="1000"
ARG USER_NAME="jenkins"

# Creating default non-user 
RUN groupadd -r $USER_NAME --gid=$USER_GID && useradd -r -g $USER_NAME --uid=$USER_UID $USER_NAME
# RUN gosu $USER_UID:$USER_GID $USER_NAME

# # Create App Directory
# RUN mkdir /app

# # Copy App files
# COPY . /app

# # Set Workdir /app and download dependecies
# WORKDIR /app
# RUN grails refresh-dependencies

# # Make port 8080 available to the world outside this container
# EXPOSE 8080

# # Set Default Behavior
# ENTRYPOINT ["grails"]
# CMD ["run-app"]
