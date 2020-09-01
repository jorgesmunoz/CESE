import os

def call_tty():
    cmdOut = os.popen('ls /dev/tty*').readlines()
    return cmdOut

print(call_tty())