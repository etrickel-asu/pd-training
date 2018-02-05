#!/usr/bin/env python
# -*- coding: utf-8 -*-
from pwn import *
from struct import pack

pinfo = process("./v3simpleBOF");

out = ''

ADDR_SIZE = XX  # in bytes

# no C source code for this one!
# look at v3simpleBOF.S, let's start doing assembly
# INTEL STYLE

out += "A"*(XX); # buffer, how many here?

# uh-oh, you'll have to add your own spacers
out += XXXX

# are we to the parmater yet, shesh, 

# now what value do we need? 
# go look at the source code
out += pack("<I",XX) # first paramter of function

# send the payload
pinfo.send(out + "\n")

# gimme back control
pinfo.interactive()

