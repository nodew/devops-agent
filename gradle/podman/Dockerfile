FROM nodew/builder-base:v1.0.0-podman

# gradle
ENV GRADLE_VERSION=8.9
ENV GRADLE_HOME /usr/local/gradle-${GRADLE_VERSION}
ENV PATH ${GRADLE_HOME}/bin:$PATH

RUN curl -fSL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle.zip && \
    echo "$(curl -sLf https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip.sha256) gradle.zip" | sha256sum --check && \
    unzip -q gradle.zip -d /usr/local && \
    rm -f gradle.zip

CMD ["gradle","--version"]
