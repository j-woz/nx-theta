
import os
import random

from persistqueue.exceptions import Empty

from nxrefine.nxserver import NXFileQueue
# from nxrefine.nxserver import NXServer

QUEUE = os.getenv("HOME") + "/QUEUE"

Q = NXFileQueue(QUEUE)

print("length: %i" % Q.qsize())

msg = "string-message-%02i" % random.randint(1,100)
print(msg)
Q.put(msg)

print("length: %i" % Q.qsize())
