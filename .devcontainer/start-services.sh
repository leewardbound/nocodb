#!/usr/bin/env bash


echo "Starting backend dev service..."
cd /workspace/packages/nocodb && npm run watch:run &

sleep 2

# Attempting to set NC_BACKEND_URL to /backend so that we can add a webpack devserver setting {proxy: {"/backend": "localhost:8080"}}
# This will fix support for NocoDB in e.g. Github Codespaces, where the frontend is available at "project-id-3000.dev.github.io"
# and the backend is at a different, dynamic hostname like "project-id-8080.dev.github.io"
# export NC_BACKEND_URL="/backend"

[[ -z "${CODESPACE_USERNAME}" ]] || export NC_BACKEND_URL="https://${CODESPACE_USERNAME}-8080.${GITHUB_CODESPACE_PUBLIC_PORT_HOSTNAME}"

echo "Starting frontend dev service..."
cd /workspace/packages/nc-gui && npm run dev