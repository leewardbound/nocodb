#!/usr/bin/env bash

cd /workspace

pushd packages/nocodb-sdk && npm install -y && npm run build && popd
pushd packages/nocodb && npm install && popd
pushd packages/nc-gui && npm install && popd