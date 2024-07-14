COMMIT := $(shell git rev-parse --short HEAD)
VERSION := 1.0.0
NAMESPACE := nodew
REGISTRY := docker.io

all: push-base maven-all dotnet-all nodejs-all go-all push-gradle push-python

maven-all: push-maven push-maven-jdk11 push-maven-jdk17 push-maven-jdk21

go-all: push-go push-go-20 push-go-21 push-go-22

dotnet-all: push-dotnet push-dotnet-6 push-dotnet-8

nodejs-all: push-nodejs push-nodejs-18 push-nodejs-20

build-base:
	docker build base -f base/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-base:$(VERSION)
push-base: build-base
	docker push $(REGISTRY)/$(NAMESPACE)/builder-base:$(VERSION)

build-maven:
	docker build maven -f maven/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-maven:$(VERSION) \
--build-arg JDK_VERSION=17 --build-arg JDK_HOME=/usr/java/default
push-maven: build-maven
	docker push $(REGISTRY)/$(NAMESPACE)/builder-maven:$(VERSION)

build-maven-jdk11:
	docker build maven -f maven/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-maven:$(VERSION)-jdk11 \
--build-arg JDK_VERSION=11 --build-arg JDK_HOME=/usr/java/default
push-maven-jdk11: build-maven-jdk11
	docker push $(REGISTRY)/$(NAMESPACE)/builder-maven:$(VERSION)-jdk11

build-maven-jdk17:
	docker build maven -f maven/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-maven:$(VERSION)-jdk17 \
--build-arg JDK_VERSION=17 --build-arg JDK_HOME=/usr/java/default
push-maven-jdk17: build-maven-jdk17
	docker push $(REGISTRY)/$(NAMESPACE)/builder-maven:$(VERSION)-jdk17

build-maven-jdk21:
	docker build maven -f maven/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-maven:$(VERSION)-jdk21 \
--build-arg JDK_VERSION=21 --build-arg JDK_HOME=/usr/java/default
push-maven-jdk21: build-maven-jdk21
	docker push $(REGISTRY)/$(NAMESPACE)/builder-maven:$(VERSION)-jdk21

build-gradle:
	docker build gradle -f gradle/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-gradle:$(VERSION)
push-gradle: build-gradle
	docker push $(REGISTRY)/$(NAMESPACE)/builder-gradle:$(VERSION)

build-dotnet:
	docker build dotnet -f dotnet/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-dotnet:$(VERSION) \
--build-arg DOTNET_VERSION=8.0
push-dotnet: build-dotnet
	docker push $(REGISTRY)/$(NAMESPACE)/builder-dotnet:$(VERSION)

build-dotnet-6:
	docker build dotnet -f dotnet/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-dotnet:$(VERSION)-6 \
--build-arg DOTNET_VERSION=6.0
push-dotnet-6: build-dotnet-6
	docker push $(REGISTRY)/$(NAMESPACE)/builder-dotnet:$(VERSION)-6

build-dotnet-8:
	docker build dotnet -f dotnet/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-dotnet:$(VERSION)-8 \
--build-arg DOTNET_VERSION=8.0
push-dotnet-8: build-dotnet-8
	docker push $(REGISTRY)/$(NAMESPACE)/builder-dotnet:$(VERSION)-8

build-nodejs:
	docker build nodejs -f nodejs/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-nodejs:$(VERSION) \
--build-arg NODE_VERSION=20.15.1 --build-arg NEW_COREPACK=true
push-nodejs: build-nodejs
	docker push $(REGISTRY)/$(NAMESPACE)/builder-nodejs:$(VERSION)

build-nodejs-18:
	docker build nodejs -f nodejs/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-nodejs:$(VERSION)-18 \
--build-arg NODE_VERSION=18.18.1
push-nodejs-18: build-nodejs-18
	docker push $(REGISTRY)/$(NAMESPACE)/builder-nodejs:$(VERSION)-18

build-nodejs-20:
	docker build nodejs -f nodejs/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-nodejs:$(VERSION)-20 \
--build-arg NODE_VERSION=20.15.1 --build-arg NEW_COREPACK=true
push-nodejs-20: build-nodejs-20
	docker push $(REGISTRY)/$(NAMESPACE)/builder-nodejs:$(VERSION)-20

build-python:
	docker build python -f python/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-python:$(VERSION)
push-python: build-python
	docker push $(REGISTRY)/$(NAMESPACE)/builder-python:$(VERSION)

build-go:
	docker build go -f go/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-go:$(VERSION) \
--build-arg GOLANG_VERSION=1.22.5
push-go: build-go
	docker push $(REGISTRY)/$(NAMESPACE)/builder-go:$(VERSION)

build-go-20:
	docker build go -f go/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-go:$(VERSION)-1.20 \
--build-arg GOLANG_VERSION=1.20.14
push-go-20: build-go-20
	docker push $(REGISTRY)/$(NAMESPACE)/builder-go:$(VERSION)-1.20

build-go-21:
	docker build go -f go/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-go:$(VERSION)-1.21 \
--build-arg GOLANG_VERSION=1.21.12
push-go-21: build-go-21
	docker push $(REGISTRY)/$(NAMESPACE)/builder-go:$(VERSION)-1.21

build-go-22:
	docker build go -f go/podman/Dockerfile -t $(REGISTRY)/$(NAMESPACE)/builder-go:$(VERSION)-1.22 \
--build-arg GOLANG_VERSION=1.22.5
push-go-22: build-go-22
	docker push $(REGISTRY)/$(NAMESPACE)/builder-go:$(VERSION)-1.22
