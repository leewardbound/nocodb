#!/usr/bin/env bash


echo "Starting backend dev service..."
cd /workspaces/nocodb/packages/nocodb && npm run watch:run &

sleep 2
export NC_BACKEND_URL="https://${CODESPACE_NAME}-8080.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
echo "Starting frontend dev service..."
cd /workspaces/nocodb/packages/nc-gui && npm run dev