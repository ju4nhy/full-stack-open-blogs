#!/bin/bash

res=$(curl -s http://localhost:8080/health)

if [ "$res" == "ok" ]; then
  echo "Succeeded curl to /health"
  exit 0 # exit status 0 means that the script "succeeds"
  fi

echo "Failed curl to /health"
exit 1 # exit status 1 means that the script "fails"