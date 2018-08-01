#!/bin/bash
set -eu

if [ "$1" == gwan ]; then
    # we are starting server directly; do some initialization
    
fi

exec "$@"