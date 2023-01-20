
import os

from nxrefine.nxserver import NXFileQueue

# TODO: Replace with contents of ~/.nxserver/settings.ini
QUEUE = os.getenv("HOME") + "/NX-Q/nxserver/task_list"

# QUEUE = os.getenv("HOME") + "/QUEUE"

Q = NXFileQueue(QUEUE)
print(QUEUE)
print("length: %i" % Q.qsize())
