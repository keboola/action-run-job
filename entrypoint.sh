#!/bin/sh -l
set -e

if [ $# -lt 4 ]
then
  echo "Some parameters are missing"
  exit 1
fi 
APP_ID=$1
TAG=$2
CONFIG_ID=$3
export KBC_STORAGE_TOKEN=$4
echo "Running configuration '${CONFIG_ID}' of application '${APP_ID}' using tag '${TAG}'."

docker pull quay.io/keboola/developer-portal-cli-v2:latest
docker run --rm -e KBC_STORAGE_TOKEN quay.io/keboola/syrup-cli:latest run-job ${KBC_DEVELOPERPORTAL_APP} ${KBC_APP_TEST_CONFIG_ID} ${TAG}
