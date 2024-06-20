#!/bin/bash

sonar-scanner \
    -Dsonar.organization=$SONAR_ORGANIZATION \
    -Dsonar.projectKey=$SONAR_PROJECT_KEY \
    -Dsonar.sources=.
