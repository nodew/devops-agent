FROM nodew/builder-base:v1.0.0-docker

ARG DOTNET_VERSION=8.0
ENV DOTNET_VERSION $DOTNET_VERSION

ARG DOTNET_SONAR_SCANNER_VERSION=6.2.0
ENV DOTNET_SONAR_SCANNER_VERSION $DOTNET_SONAR_SCANNER_VERSION

RUN yum install -y krb5-libs libicu openssl-libs compat-openssl11 libgdiplus libstdc++-devel

RUN wget https://dot.net/v1/dotnet-install.sh

RUN chmod a+x dotnet-install.sh

RUN sh dotnet-install.sh -c ${DOTNET_VERSION} --install-dir /usr/share/dotnet

RUN ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

ENV PATH $PATH:/root/.nuget/tools:/root/.dotnet/tools

RUN dotnet tool install --global dotnet-sonarscanner --version ${DOTNET_SONAR_SCANNER_VERSION}

CMD ["dotnet", "--version"]
