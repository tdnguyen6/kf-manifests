#!/usr/bin/env bash

helmfile -f helm sync

sjsonnet -J /home/tidu/repos/jsonnet-lib-gen/gen/github.com/jsonnet-libs resources/tls/aio-tls.jsonnet --yaml-out | kubectl apply -f -


while ! kustomize build tidu | kubectl apply -f -; do echo "Retrying to apply resources"; sleep 10; done