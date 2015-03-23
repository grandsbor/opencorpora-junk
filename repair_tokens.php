<?php
require('lib/header.php');
require_once('lib/lib_dict.php');

die("Script disabled");

if (!is_admin()) {
    return;
}

sql_begin(true);
if (sql_query_pdo("INSERT INTO `rev_sets` VALUES(NULL, '".time()."', '0', '".mysql_real_escape_string('Substitute UNKN to LATN/ROMN for Roman numbers')."')")) {
    $revset_id =  sql_insert_id_pdo();
}
else
    die("failed to create revset");

$res = sql_query_pdo("select tf_id, tf_text, rev_id FROM tokens RIGHT JOIN tf_revisions USING (tf_id) WHERE is_last=1 AND rev_text LIKE '%\"UNKN\"%'");
while ($r = sql_fetch_array($res)) {
    //if (preg_match('/^\p{P}+$/u', $r['tf_text']))
    //if (preg_match('/^\p{Nd}+[\.,]?\p{Nd}*$/u', $r['tf_text']))
    if (preg_match('/^[IVXLCMivxlcm]+$/u', $r['tf_text'])) {
        if (
            !sql_query_pdo("UPDATE tf_revisions SET is_last=0 WHERE rev_id = ".$r['rev_id']." LIMIT 1") ||
            !sql_query_pdo("INSERT INTO tf_revisions VALUES (NULL, '$revset_id', '".$r['tf_id']."', '".mysql_real_escape_string(generate_tf_rev($r['tf_text']))."', 1)")
        )
            die("error");
    }
}

sql_commit(true);
print "ok";
