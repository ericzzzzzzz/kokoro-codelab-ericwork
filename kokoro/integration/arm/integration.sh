#!/bin/bash

echo "from arm ${KOKORO_JOB_NAME#*_}"
echo "${DOCKER_NAMESPACE}"
