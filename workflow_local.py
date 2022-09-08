
import os
import random

from persistqueue.exceptions import Empty

from nxrefine.nxserver import NXFileQueue
# from nxrefine.nxserver import NXServer

def parse_args():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("count", help="Count of tasks to add",
                        type=int)
    args = parser.parse_args()
    return args


args = parse_args()

QUEUE = os.getenv("HOME") + "/QUEUE"

Q = NXFileQueue(QUEUE)

print("length before: %i" % Q.qsize())

for i in range(0, args.count):
    msg = "string-message-%02i" % random.randint(1,100)
    print(msg)
    Q.put(msg)

print("length after: %i" % Q.qsize())
