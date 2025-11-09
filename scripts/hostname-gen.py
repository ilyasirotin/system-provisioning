#!/usr/bin/env python3

import random
import string

chars = string.ascii_lowercase + string.digits
hostnames = set()

print("=============")
while len(hostnames) < 20:
    hostnames.add(f"mbp-{''.join(random.choices(chars, k=8))}")

print('\n'.join(sorted(hostnames)))
print("=============")
