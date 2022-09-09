
import sys, time

def do_work(msg):
    print("do_work: " + msg + " ...")
    sys.stdout.flush()
    # Last two characters are numbers:
    t = msg[-2:]
    delay = int(t) / 10
    time.sleep(delay)
    print("do_work: " + msg + " done.")
    sys.stdout.flush()
    return len(msg)
