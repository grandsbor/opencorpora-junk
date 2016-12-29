#!/usr/bin/env python2
# -*- coding: utf8 -*-
import sys
sys.path.append('/corpus/python')
from Annotation import AnnotationEditor


TID2UID = {
    '0cd896e862895e4cabab33c5c6c3817a': 6974,
    '58c3d7e03206d7cb947c33735acf3791': 6975,
    '706203467d0b0b77d1534727ea704a7d': 6976,
    '96ac970568fe6d11fe3c5d90868a8f70': 6977,
    'bec5b6a7656416a19bbc66c95c187e61': 6978,
    'e77964ab57f97563559d4e219a17aae8': 6979,
}

ANSWERS = {
    'ADVB': 1,
    'CONJ': 2,
    'NPRO': 3,
    'PRCL': 4,
}

EDITOR = AnnotationEditor('/corpus/config.ini')

def find_slot_for_answer(token_id):
    # ignore owned but non-answered instances
    rows = EDITOR.sql("""
        SELECT instance_id
        FROM morph_annot_instances
        JOIN morph_annot_samples USING (sample_id)
        JOIN morph_annot_pools USING (pool_id)
        WHERE tf_id = {}
        AND pool_type = 81
        AND answer = 0
    """.format(token_id), True)
    if rows:
        print(row[0]['instance_id'])
        return row[0]['instance_id']
    return None

def try_insert(token_id, user_id, answer):
    instance_id = find_slot_for_answer(token_id)
    if instance_id:
        EDITOR.sql("UPDATE morph_annot_instances SET user_id={}, ts_finish=UNIX_TIMESTAMP(), answer={} WHERE instance_id={} LIMIT 1".format(user_id, answer, instance_id))
        sys.stderr.write("inserted ok: token_id={}, instance id={}, user_id={}, answer={}\n".format(token_id, instance_id, user_id, answer))
    else:
        sys.stderr.write("no slot for answer: token_id={}, user_id={}, answer={}\n".format(token_id, user_id, answer))

def add_from_tsv(path):
    with open(path) as f:
        for l in f:
            parts = l.strip().split('\t')
            token_id = int(parts[0])
            answer = ANSWERS[parts[1]]
            user_id = TID2UID[parts[2]]
            try_insert(token_id, user_id, answer)

def main():
    add_from_tsv(sys.argv[1])
    #EDITOR.commit()

if __name__ == "__main__":
    main()
