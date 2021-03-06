#!/bin/bash 

# Treat unset variables as errors
set -o nounset 

# Load common functions and constants
 source ./sh/shared.sh

main() {
  echo "$(hostname): stop.sh: touch $TERMINATE_FILE"
  # Create the termination file
  touch $TERMINATE_FILE
  # Wait for the application to terminate graciously
  # ( When this script returns, docker/kubernetes
  # assumes it is safe to kill the container )
  # ? After the application has terminated, this
  # ? script will terminate as well.
  sleep 5s
  echo "$(hostname): stop.sh: exiting"
}

main "$@"
