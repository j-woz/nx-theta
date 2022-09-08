#!/bin/bash
set -eu

case ${#} in
  0) MODE="compute" ;;
  1) MODE=$1        ;;
  *) exit 1         ;;  # Bash prints an error
esac

THIS=$( realpath $( dirname $0 ) )

if ! source $THIS/settings-$MODE.sh
then
  echo "start-workers: Could not source settings for MODE=$MODE"
  exit 1
fi

# Python with persistqueue:
PY=/projects/Swift-T/public/sfw/login/Miniconda_2022-07-28

PATH=$SWIFT/stc/bin:$PATH
PATH=$PY/stc/bin:$PATH

which swift-t
swift-t -p ${MACHINE[@]} $THIS/workers.swift
