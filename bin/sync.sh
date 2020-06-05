#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname $DIR)"

cd "${PROJECT_DIR}" || exit 1

# Define a task
DEFAULT_TASK=in
TASK=${1:-${DEFAULT_TASK}}

echo Performing syncronisation task \"${TASK}\"...

# Run requested task
if [ "${TASK}" = "in" ]; then
  echo Synchronisung \"./notebooks/data\" from S3...
  aws s3 sync s3://${S3_BUCKET}/data ${PROJECT_DIR}/notebooks/data
elif [ "${TASK}" = "out" ]; then
  echo Synchronisung \"./notebooks/data\" to S3...
  aws s3 sync ${PROJECT_DIR}/notebooks/data s3://${S3_BUCKET}/data
else
  echo "Wrong run task: ${TASK}"
  exit 1
fi

