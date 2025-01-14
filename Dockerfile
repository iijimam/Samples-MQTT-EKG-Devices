#2021.1
ARG IMAGE=store/intersystems/irishealth-community:2021.1.0.215.3
ARG IMAGE=containers.intersystems.com/intersystems/irishealth-community:2021.1.0.215.3
FROM $IMAGE

USER root

RUN mkdir /opt/irisbuild && chown irisowner:irisowner /opt/irisbuild

WORKDIR /opt/irisbuild




USER irisowner
COPY ./src ./src/
COPY ./Installer.cls ./
COPY iris.script iris.script


RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly

