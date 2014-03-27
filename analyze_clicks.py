#!/usr/bin/env python
import sys
import fileinput
from collections import defaultdict

def is_answer(event):
    clck = event[3]
    return (clck < 10 or clck == 77)

def is_context(event):
    clck = event[3]
    return (clck == 11 or clck == 12)

def median(alist):
    srtd = sorted(alist) # returns a sorted copy
    mid = len(alist)/2   # remember that integer division truncates

    if len(alist) % 2 == 0:  # take the avg of middle two
        return (srtd[mid-1] + srtd[mid]) / 2.0
    else:
        return srtd[mid]

def main():
    type2times = defaultdict(list)
    type2compl = {}

    last_event = None
    last_uid = 0

    for line in fileinput.input():
        fields = line.strip().split('\t')
        if not fields[0].isdigit():
            print('skipped')
            continue
        event = map(int, fields)
        if is_context(event):
            continue
        #print(event)

        uid, time, sample, click, pool_type, complexity = event
        type2compl[pool_type] = complexity

        if uid == last_uid and is_answer(event) and not (is_answer(last_event) and sample == last_event[2]):
            #print(time - last_event[1])
            type2times[pool_type].append(time - last_event[1])

        last_uid = uid
        last_event = event

    for pool_type in type2times:
        print("{0}\t{1}\t{2}".format(pool_type, type2compl[pool_type], median(type2times[pool_type])))

main()
