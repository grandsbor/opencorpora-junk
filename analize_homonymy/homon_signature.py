#!/usr/bin/env python
import sys
import re

ONLY_POS = 1
NO_SPEC = 2
ALL = 3

MODE = ALL

def signature(var_xml):
    res = re.findall('<g v="([^"]+)"', var_xml)
    gram = []
    for g in res:
        if (
            MODE == ALL
            or (MODE == ONLY_POS and re.match('^[A-Z]+$', g))
            or (MODE == NO_SPEC and not re.match('[A-Z][^A-Z]', g))
        ):
            gram.append(g)

    return '&'.join(sorted(gram))

numbers = set()
sign_count = {}

for num in open(sys.argv[2]):
    numbers.add(num.rstrip())

for l in open(sys.argv[1]):
    res = re.search('token id="([0-9]+)"', l)
    if res.group(1) not in numbers:
        continue

    res = re.findall('<v>(.+?)</v>', l)
    signs = set()
    for v in res:
        signs.add(signature(v))

    if len(signs) < 2:
        print(l)
        continue

    signs_str = '@'.join(sorted(signs))
    if signs_str not in sign_count:
        sign_count[signs_str] = 0
    sign_count[signs_str] += 1

for k in sorted(sign_count, key=sign_count.get, reverse=True):
    print("{0}: {1}".format(k, sign_count[k]))
