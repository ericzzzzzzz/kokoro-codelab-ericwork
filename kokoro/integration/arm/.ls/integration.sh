#!/bin/bash

echo "from amd ${KOKORO_JOB_NAME#*_}"
echo "${DOCKER_NAMESPACE}"
