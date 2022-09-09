#!/bin/bash
set -eu

# Usage: start-workers.sh [-n PROCS] [MODE=local|compute]
# PROCS defaults to 2 (1 process is reserved for Swift/T)
# MODE defaults to "compute"

PROCS=2
while getopts "n:" OPT
do
  case $OPT in
    n) PROCS=$OPTARG ;;
    ?) # Bash prints an error
       exit 1        ;;
  esac
done
shift $(( OPTIND - 1 ))

case ${#} in
  0) MODE="compute" ;;
  1) MODE=$1        ;;
  *) echo "start-workers: bad argument count: ${#}"
     exit 1         ;;
esac

THIS=$( realpath $( dirname $0 ) )

if ! source $THIS/settings-$MODE.sh
then
  echo "start-workers: Could not source settings for MODE=$MODE"
  exit 1
fi

which swift-t
set -x
swift-t -p ${MACHINE[@]} -n $PROCS $THIS/workers.swift
