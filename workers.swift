
import io;
import python;
import sys;

string code = """
import os, sys
from persistqueue.exceptions import Empty
from nxrefine.nxserver import NXFileQueue

QUEUE = os.getenv("HOME") + "/QUEUE"

Q = NXFileQueue(QUEUE)

print("Q: " + str(Q))
try:
  TASK = Q.get(block=False, timeout=1)
  print("py: TASK: " + str(TASK))
  sys.stdout.flush()
except Empty:
  TASK = "PERSISTQUEUE.EMPTY"
  print("py: Q is EMPTY")
  sys.stdout.flush()
""";

s, c = system1("which python");
printf("using python: %s", s);

(void v) loop()
{
  for (boolean b = true, int i = 1;
       b;
       b=c, i = i + 1)
  {
    boolean c;
    task = python_persist(code, "TASK");
    if (task == "PERSISTQUEUE.EMPTY")
    {
      c = false => v = propagate(task);
    }
    else
    {
      printf("swift: TASK=%s", task) =>
      c = true;
    }
  }
}

trace("START") =>
  loop() =>
  trace("STOP");
