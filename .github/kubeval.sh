#!/bin/bash
set -euo pipefail

SCHEMA_LOCATION="https://kubernetesjsonschema.dev/"
KUBEVAL_VERSION="0.15.0"
OS=$(uname)
CHART_DIRS=$(ls -d charts/*)

# install kubeval
curl --silent --show-error --fail --location --output /tmp/kubeval.tar.gz https://github.com/instrumenta/kubeval/releases/download/"${KUBEVAL_VERSION}"/kubeval-${OS}-amd64.tar.gz
tar -xf /tmp/kubeval.tar.gz kubeval

for CHART_DIR in ${CHART_DIRS}; do
  echo "validating with kubeval for chart in folder: '$CHART_DIR'"
  helm template --values "${CHART_DIR}"/ci/kubeval.yaml "${CHART_DIR}" | ./kubeval --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
done