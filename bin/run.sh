#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname $DIR)"

cd "${PROJECT_DIR}" || exit 1

# Setup environment variables
echo Loading application parameters...
export $(python ./notebooks_4life/app_initializer.py)
export PYTHONPATH=$PYTHONPATH:$PROJECT_DIR

# Define a task
DEFAULT_TASK=lab
TASK=${1:-${DEFAULT_TASK}}

# Set config directory if not defined
export JUPYTER_CONFIG_DIR=${JUPYTER_CONFIG_DIR:-${PROJECT_DIR}}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-${PROJECT_DIR}}

# Syncronize folders
if [ "${SYNC_ON_START}" = "True" ]; then
  ./bin/sync.sh in
fi

echo Performing startup task \"${TASK}\"...

# Run requested task
if [ "${TASK}" = "notebook" ]; then
  jupyter-notebook
elif [ "${TASK}" = "lab" ]; then
  jupyter lab
elif [ "${TASK}" = "hub" ]; then
  jupyterhub
else
  echo "Wrong run task: ${TASK}"
  exit 1
fi

