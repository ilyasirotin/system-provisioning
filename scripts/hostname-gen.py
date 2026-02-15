#!/usr/bin/env python3

import random
import string
import platform

chars = string.ascii_lowercase + string.digits
hostnames = set()

match platform.system():
    case 'Linux': prefix = 'lnx'
    case _: prefix = 'mbp'

print("=============")
while len(hostnames) < 5:
    hostnames.add(f"{prefix}-{''.join(random.choices(chars, k=8))}")

print('\n'.join(sorted(hostnames)))
print("=============")
