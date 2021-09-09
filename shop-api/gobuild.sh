#!/bin/bash

export GO111MODULE=on

for r in routes/*; do
  if [ -d "$r" ]; then
    r=$(basename "$r")
    env GOOS=linux go build -ldflags="-s -w" -o bin/$r routes/$r/main.go
  fi
done
