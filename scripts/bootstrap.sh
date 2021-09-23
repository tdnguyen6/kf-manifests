#!/usr/bin/env bash

./scripts/build.py | kubectl apply -f -

helmfile -f helm/helmfile.yml sync

# ./scripts/nvidia-gpu.sh

# kubectl apply -k extra/kustomize/out/

# sleep 10

while ! kustomize build tidu | kubectl apply -f -; do echo "Retrying to apply resources"; sleep 10; done