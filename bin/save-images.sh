#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname $DIR)"

cd "${PROJECT_DIR}" || exit 1

docker save "$(docker-compose config | awk '{if ($1 == "image:") print $2;}')" | gzip > docker-images.tar.gz
