FROM nodew/builder-base:v1.0.0

# java
# ENV JAVA_VERSIOIN 21
# RUN yum install -y java-${JAVA_VERSIOIN}-openjdk-devel && \
#     yum -y clean all

# gradle
ENV GRADLE_VERSION 8.9
ENV GRADLE_HOME /usr/local/gradle-${GRADLE_VERSION}
ENV PATH ${GRADLE_HOME}/bin:$PATH

RUN curl -fSL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle.zip && \
    echo "$(curl -sLf https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip.sha256) gradle.zip" | sha256sum --check && \
    unzip -q gradle.zip -d /usr/local && \
    rm -f gradle.zip

# COPY set_java $GRADLE_HOME
# RUN $GRADLE_HOME/set_java && \
#     rm -f $GRADLE_HOME/set_java

CMD ["gradle","--version"]
