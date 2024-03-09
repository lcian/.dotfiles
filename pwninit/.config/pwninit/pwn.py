#!/usr/bin/env python3
from pwn import *

{bindings}
context.binary = {bin_name}
context.log_level = "debug"
context.terminal = ['tmux', 'splitw', '-h', '-P']
gdb_script = """

"""

nc = "{nc}"
def conn(): # default: local    R: remote    D: debug
    if args.R:
        addr = nc.split(" ")[1]
        port = int(nc.split(" ")[2])
        r = remote(addr, port)
    else:
        r = process({proc_args})
        if args.D:
            gdb.attach(r, gdb_script)
    return r

r = conn()



r.interactive()
