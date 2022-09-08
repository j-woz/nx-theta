
import io;
import python;
import sys;

code = """
import os

from persistqueue.exceptions import Empty

from nxrefine.nxserver import NXFileQueue
# from nxrefine.nxserver import NXServer

QUEUE = os.getenv("HOME") + "/QUEUE"

Q = NXFileQueue(QUEUE)

print("Q: " + str(Q))
t = Q.get()
print("task: " + str(t))

""";

s, c = system1("which python");
printf("using python: %s", s);

trace("START") =>
  python_persist(code, "repr(0)") =>
  trace("STOP");
