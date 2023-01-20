
import sys, time
import subprocess

def do_work(msg):
    print("do_work: " + msg + " ...")
    sys.stdout.flush()
    subprocess.call(msg.split())
    sys.stdout.flush()



    return len(msg)
