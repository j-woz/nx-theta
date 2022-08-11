#!/bin/bash
set -eu

PATH=/projects/Swift-T/public/sfw/theta/compute/swift-t/2022-08-08/stc/bin:$PATH

export PROJECT=AXMAS-Flows
export QUEUE=debug-cache-quad
export WALLTIME=00:05:00

THIS=$( dirname $( realpath $0 ) )

swift-t -m theta $THIS/workers.swift
