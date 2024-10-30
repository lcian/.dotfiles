<%page args="binary, host=None, port=None, user=None, password=None, libc=None, remote_path=None, quiet=False"/>\
<%
import os
import sys

from pwnlib.context import context as ctx
from pwnlib.elf.elf import ELF
from pwnlib.util.sh_string import sh_string
from elftools.common.exceptions import ELFError

argv = list(sys.argv)
argv[0] = os.path.basename(argv[0])

try:
    if binary:
       ctx.binary = ELF(binary, checksec=False)
except ELFError:
    pass

if not binary:
    binary = './path/to/binary'

exe = os.path.basename(binary)

remote_path = remote_path or exe
binary_repr = repr(binary)
libc_repr = repr(libc)
%>\
#!/usr/bin/env python3
from pwn import *

exe = context.binary = ELF(${binary_repr})
%if libc:
libc = ELF(${libc_repr}, checksec=False)
%endif
context.log_level = "DEBUG"
context.terminal = ["tmux", "splitw", "-h", "-P"]
gdb_script = """
%if ctx.binary:
  %if 'main' in ctx.binary.symbols:
b *main
  %elif 'DYN' != ctx.binary.elftype:
b *0x{exe.entry:x}
  %endif
%endif
continue
"""

def conn(): # default: local    R: remote    D: debug
    if args.R:
        r = remote("${host}", ${port})
    else:
        r = process(${binary_repr})
        if args.D:
            gdb.attach(r, gdb_script)
    return r

r = conn()

payload = flat(

)

r.sendlineafter(b"> ", payload)

r.interactive()
