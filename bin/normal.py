#!/usr/bin/env python3

import random
import time
import os


# Generate a random number from a Gaussian distribution
def cgauss(target, deviation=-1, convexity=-1):
    if deviation < 0:
        deviation = target
    if convexity < 0:
        convexity = .35
    rmin = target - deviation
    rmax = target + deviation
    while True:
        res = random.gauss(target, deviation*convexity)
        if rmin <= res <= rmax:
            break
    return res

# Small terminal test
test1 = {key: 0 for key in range(21)}
while all(v < 700 for v in test1.values()):
    n = round(cgauss(10))
    test1[n] += 1
for k, v in test1.items():
    print(f'{k:02d} ' + '#'*(v//10))

# Large terminal test
test2 = {key: 0 for key in range(41)}
record = []
while all(v < 1500 for v in test2.values()):
    nf = cgauss(20, 20, .75)
    record += [nf]
    n = round(nf)
    test2[n] += 1
for k, v in test2.items():
    print(f'{k:02d} ' + '#'*(round(v/10)))
print(sum(record)/len(record))

# Print in ANSI color code based on grayscale value from 0 to 1
# https://i.stack.imgur.com/Vn0V3.png
def gprint(txt, val):
    # ASCII 256 color includes a grayscale range from 232 to 255 (232+23)

    # Grayscale
    # color_code = int(val * 23 + 232)

    # corrected to be brighter than my terminal bg
    # color_code = int(val * 19 + 236)

    # fire
    # color_code = int(val * 5) * 5 + 21
    color_code = int(val * 5) * 6 + 196

    # Put it on the screen
    print(f'\033[38;5;{color_code}m' + txt + '\033[0m')

# large terminal test
for _ in range(32):
    rows, cols = [int(txt) for txt in os.popen('stty size', 'r').read().split()]
    rows -= 2
    cols -= 1
    width = cols
    test = {}
    test = {key: 0 for key in range(rows+1)}
    while all(v < width for v in test.values()):
        nf = cgauss(rows//2)
        n = round(nf)
        test[n] += 1
    for k, v in test.items():
        v = round(random.random()*width)
        txt = (f'{k:02d} ' + '#'*v)
        color = v / width
        gprint(txt, color)
    time.sleep(.1)

# large terminal test
# for _ in range(32):
while True:
    rows, cols = [int(txt) for txt in os.popen('stty size', 'r').read().split()]
    rows -= 2
    cols -= 1
    width = cols
    headroom = round(width * .2)
    width = cgauss(width-headroom, headroom)
    test = {}
    test = {key: 0 for key in range(rows+1)}
    while all(v < width for v in test.values()):
        nf = cgauss(rows//2)
        n = round(nf)
        test[n] += 1
    for k, v in test.items():
        txt = (f'{k:02d} ' + '#'*v)
        color = v / width
        gprint(txt, color)
    time.sleep(.1)

