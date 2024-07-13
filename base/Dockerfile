FROM rockylinux:9

# utils
RUN yum install -y epel-release ca-certificates && \
  yum install -y unzip \
  which \
  make \
  wget \
  zip \
  bzip2 \
  gcc \
  gcc-c++ \
  curl-devel \
  autoconf \
  expat-devel \
  gettext-devel \
  openssl-devel \
  perl-devel \
  zlib-devel \
  python-pip \
  java-17-openjdk && \
  yum -y clean all --enablerepo='*'

ENV GIT_VERSION 2.45.2

RUN wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.gz && \
    tar zxvf git-${GIT_VERSION}.tar.gz --no-same-owner && \
    cd git-${GIT_VERSION} && \
    make configure && \
    ./configure prefix=/usr/local/git/ && \
    make && \
    make install && \
    mv /usr/local/git/bin/git /usr/bin/ && \
    cd ..&& \
    rm -rf git-${GIT_VERSION}.tar.gz git-${GIT_VERSION} && \
    git version


# Set the locale(en_US.UTF-8)
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8

# USER jenkins
WORKDIR /home/jenkins

ENV SONAR_SCANNER_VERSION 6.1.0.4477

RUN curl -o sonar_scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux-x64.zip && \
    unzip sonar_scanner.zip && rm sonar_scanner.zip \
    && rm -rf sonar-scanner-$SONAR_SCANNER_VERSION-linux-x64/jre && \
    sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /home/jenkins/sonar-scanner-$SONAR_SCANNER_VERSION-linux-x64/bin/sonar-scanner && \
    mv /home/jenkins/sonar-scanner-$SONAR_SCANNER_VERSION-linux-x64 /usr/bin

ENV PATH $PATH:/usr/bin/sonar-scanner-$SONAR_SCANNER_VERSION-linux-x64/bin

COPY ./ ./
RUN ./hack/install_utils.sh && rm -rf ./*

CMD ["docker","version"]
