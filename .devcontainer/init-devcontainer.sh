#!/usr/bin/env bash

cd /workspaces/nocodb

npm run install:npm:dep

pushd packages/nocodb-sdk && npm install && npm run build && popd
pushd packages/nocodb && npm install && popd
pushd packages/nc-gui && npm install && popd