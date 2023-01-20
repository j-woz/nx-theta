
import io;
import python;
import sys;

// # QUEUE = os.getenv("HOME") + "/QUEUE"

import os, sys
from persistqueue.exceptions import Empty
from nxrefine.nxserver import NXFileQueue


string code = """
QUEUE = os.getenv("HOME") + "/NX-Q/nxserver/task_list"
Q = NXFileQueue(QUEUE)
try:
  TASK = Q.get(block=False, timeout=1)
except Empty:
  TASK = "PERSISTQUEUE.EMPTY"
""";

  // print("py: TASK: " + str(TASK))
  // sys.stdout.flush()


  // print("py: Q is EMPTY")
  // sys.stdout.flush()


s, c = system1("which python");
printf("using python: %s", s);

(void v) loop()
{
  for (boolean b = true, int i = 1;
       b; b=c, i = i + 1)
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
      do_task(task);
    }
  }
}

(string s) do_task(string msg)
{
  s = python_persist(
"""
import do_work
s = do_work.do_work("%s")
""" % msg,
"repr(s)"
);
}

trace("WORKFLOW START") =>
  loop() =>
  trace("WORKFLOW STOP");
