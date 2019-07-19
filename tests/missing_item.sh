#!/usr/bin/env bash

curl -v -d @'missing_item.json' -H 'Content-Type: application/json' \
     'http://127.0.0.1:8000'
echo
