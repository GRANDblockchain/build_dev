#!/bin/bash
set -e
set +x
cd microservices

kill -9 $(lsof -t -i:8018) || echo "WARNING: Nothing running on port 8018, or failed to kill processes"
kill -9 $(lsof -t -i:3305) || echo "WARNING: Nothing running on port 3305, or failed to kill processes"
kill -9 $(lsof -t -i:9970) || echo "WARNING: Nothing running on port 9970, or failed to kill processes"
kill -9 $(lsof -t -i:8071) || echo "WARNING: Nothing running on port 8071, or failed to kill processes"
kill -9 $(lsof -t -i:8009) || echo "WARNING: Nothing running on port 8009, or failed to kill processes"

docker-compose -f docker-compose-windows.yml down
