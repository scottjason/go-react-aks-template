#!/bin/bash

docker buildx build --platform linux/amd64 -t scottjason/frontend:latest --push ./frontend
docker buildx build --platform linux/amd64 -t scottjason/backend:latest --push ./backend
