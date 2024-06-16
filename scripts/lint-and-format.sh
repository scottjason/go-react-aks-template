#!/bin/bash

set -e

# Navigate to the backend directory where the go.mod file is located
cd "$(dirname "$0")/../backend"

echo "Running gofmt..."
gofmt -s -w .

echo "Running goimports..."
goimports -w .

echo "Running golangci-lint..."
golangci-lint run
