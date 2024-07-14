FROM nodew/builder-base:v1.0.0-docker

# python3
ENV PYTHON_VERSION 3.12.4

RUN yum -y install bzip2-devel libffi-devel libsqlite3x-devel && \
    curl -fSL https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz -o /usr/src/Python-${PYTHON_VERSION}.tgz

RUN tar xzf /usr/src/Python-${PYTHON_VERSION}.tgz -C /usr/src/ --no-same-owner && \
    cd /usr/src/Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations --with-ensurepip=install --enable-loadable-sqlite-extensions && \
    make -j 2 && make -j 2 altinstall

RUN cd ../ && \
    rm -rf /usr/src/Python-${PYTHON_VERSION}.tgz /usr/src/Python-${PYTHON_VERSION} && \
    ln -fs /usr/local/bin/python3.12 /usr/bin/python && \
    ln -fs /usr/local/bin/python3.12 /usr/bin/python3 && \
    ln -fs /usr/local/bin/pip3.12 /usr/bin/pip && \
    python3 -m pip install --upgrade pip

RUN yum -y remove bzip2-devel libffi-devel libsqlite3x-devel && \
    yum -y clean all

CMD ["python","--version"]
