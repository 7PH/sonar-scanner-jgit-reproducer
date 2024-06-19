#!/bin/bash

sonar-scanner \
    -Dsonar.organization=$SONAR_ORGANIZATION \
    -Dsonar.projectKey=$SONAR_TOKEN \
    -Dsonar.sources=.
