#!/bin/sh
set -e

defaultSettings='<?xml version="1.0" encoding="UTF-8"?><settings xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd" xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"></settings>'
defaultPom='<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd"><modelVersion>4.0.0</modelVersion><groupId>com.mycompany.app</groupId><artifactId>my-app</artifactId><packaging>jar</packaging><version>1.0-SNAPSHOT</version><name>my-app</name></project>'

defaultSettingsFile='.settings.default.xml'
defaultPomFile='.pom.default.xml'

if [[ -z "${MAVEN_OPTS}" ]]; then
  mavenOpts=""
else
  mavenOpts="${MAVEN_OPTS}"
fi

echo "$defaultSettings" > $defaultSettingsFile
echo "$defaultPom" > $defaultPomFile

mvn -s $defaultSettingsFile -f $defaultPomFile $mavenOpts -N io.takari:maven:0.7.6:wrapper "$@"


rm $defaultSettingsFile $defaultPomFile
