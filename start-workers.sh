#!/bin/bash
set -eu

# Python with persistqueue:
PY=/projects/Swift-T/public/sfw/login/Miniconda_2022-07-28
SWIFT=/projects/Swift-T/public/sfw/theta/compute/swift-t/2022-08-27

PATH=$SWIFT/stc/bin:$PATH
PATH=$PY/stc/bin:$PATH

export PROJECT=AXMAS-Flows
export QUEUE=debug-cache-quad
export WALLTIME=00:02:00

THIS=$( dirname $( realpath $0 ) )

swift-t -p -m theta $THIS/workers.swift

# /projects/Swift-T/public/sfw/login/Anaconda-2021.11_2022-07-28/bin/python
