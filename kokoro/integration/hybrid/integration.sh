#!/bin/bash

echo "from hybrid ${KOKORO_JOB_NAME#*_}"
echo "${DOCKER_NAMESPACE}"
