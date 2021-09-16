# Install dependencies only when needed
FROM gosu:alpine

ARG VERSION_JAVA="8.0.302-zulu "
ARG VERSION_MAVEN="3.8.2"
ARG VERSION_GROOVY="2.1.9"
ARG VERSION_GRADLE="7.2"
ARG VERSION_GRAILS="2.3.8"

RUN apt-get update && apt-get install -y unzip zip curl wget

# Install Grails
RUN curl -s "https://get.sdkman.io" | bash

RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install java $VERSION_JAVA" 
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install maven $VERSION_MAVEN" 
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install groovy $VERSION_GROOVY" 
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install gradle $VERSION_GRADLE" 
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && yes | sdk install grails $VERSION_GRAILS" 

RUN /bin/bash -c "rm -rf $HOME/.sdkman/archives/* && rm -rf $HOME/.sdkman/tmp/* && rm -rf /opt/sdkman && rm -rf /tmp/*"

# # Set Default Behavior
ENTRYPOINT ["grails"]
CMD ["run-app"]
