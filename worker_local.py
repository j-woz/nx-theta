
import os

from persistqueue.exceptions import Empty

from nxrefine.nxserver import NXFileQueue
# from nxrefine.nxserver import NXServer

QUEUE = os.getenv("HOME") + "/QUEUE"

Q = NXFileQueue(QUEUE)

print("length: %i" % Q.qsize())

# Q.put("string-message-1")
try:
    msg = Q.get(timeout=1)
except Empty:
    print("EMPTY")
    msg = None

print("length: %i" % Q.qsize())

print(str(msg))
