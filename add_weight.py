#!/usr/bin/env python
import math

for line in open('click_log_analysis'):
    pool_type, compl, median = map(float, line.strip().split('\t'))
    if compl == 0:
        continue
    print("UPDATE morph_annot_pool_types SET rating_weight={0} WHERE type_id={1} LIMIT 1; ".format(int(round(math.log((median + compl * 2) / 2, 2) * 10)), int(pool_type)))
