#!/usr/bin/env python2
# -*- coding: utf8 -*-
import sys
sys.path.append('/corpus/python')
from Syntax import PossibleGroupFinder as PGF

finder = PGF(xml=sys.argv[1])
for f in finder.find(pattern=['^в$', '^(течение|течении)$']):
    print("{0}\t{1}\t{2}".format(f.sentence_id, ','.join(map(str, f.ids)), f.sentence_fulltext))
