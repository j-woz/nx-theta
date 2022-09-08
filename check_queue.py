
import os

from nxrefine.nxserver import NXFileQueue

QUEUE = os.getenv("HOME") + "/QUEUE"

Q = NXFileQueue(QUEUE)
print("length: %i" % Q.qsize())
