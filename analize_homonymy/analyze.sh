#!/usr/bin/env bash
TMP_XML=./annot.ambig.xml
TMP_TIDS=./tokens_in_pools
TMP_TIDS_AMB=./tokens_ambig
TMP_TIDS_FREE=./tokens_not_in_pools

if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_export_annot.xml>"
    exit
fi

grep '<token' $1 | grep '</v><v>' > $TMP_XML
echo 'select distinct tf_id from morph_annot_samples ORDER BY tf_id' | mysql -Dopcorpora > $TMP_TIDS
echo 'select distinct tf_id from morph_annot_candidate_samples ORDER BY tf_id' | mysql -Dopcorpora >> $TMP_TIDS
sort $TMP_TIDS > $TMP_TIDS.sorted
grep -Eo 'token id="[0-9]+"' $TMP_XML | cut -d'"' -f2 | sort >$TMP_TIDS_AMB
comm -2 -3 $TMP_TIDS_AMB $TMP_TIDS.sorted >$TMP_TIDS_FREE

./homon_signature.py $TMP_XML $TMP_TIDS_FREE
