#!/bin/bash

# กำหนด Config
DOCKER_USERNAME="384supawit"
# กำหนด Config
DOCKER_USERNAME="384supawit"
REPO_NAME="supawit-wongsupa"

echo "Building and Pushing Multi-Platform images (AMD64 + ARM64) to: $DOCKER_USERNAME/$REPO_NAME"

# สร้าง Builder (ถ้ายังไม่มี)
docker buildx create --use --name mybuilder 2>/dev/null || docker buildx use mybuilder

# 1. Frontend -> Tag: frontend
echo "--------------------------------------"
echo "Processing Frontend..."
docker buildx build --platform linux/amd64,linux/arm64 \
  -t $DOCKER_USERNAME/$REPO_NAME:frontend \
  --push ./frontend

# 2. Backend -> Tag: backend
echo "--------------------------------------"
echo "Processing Backend..."
docker buildx build --platform linux/amd64,linux/arm64 \
  -t $DOCKER_USERNAME/$REPO_NAME:backend \
  --push ./backend

echo "--------------------------------------"
echo "✅ Done! Multi-Platform Images pushed:"
echo "   - Frontend: $DOCKER_USERNAME/$REPO_NAME:frontend"
echo "   - Backend:  $DOCKER_USERNAME/$REPO_NAME:backend"
echo "   (Supports both Windows/Intel and Mac/Apple Silicon)"