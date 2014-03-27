<?php
require('lib/header.php');
require_once('lib/lib_dict.php');
sql_begin();
if (sql_query("INSERT INTO `rev_sets` VALUES(NULL, '".time()."', 1, '".mysql_real_escape_string('Fix annotations, see issues 437, 441')."')")) {
    $revset_id =  sql_insert_id();
}
else
    die("failed to create revset");


$res = sql_query("SELECT tf_id, tf.tf_text FROM tf_revisions tfr LEFT JOIN text_forms tf USING (tf_id) WHERE is_last=1 AND tfr.rev_text like '%\"\"%'");
while ($r = sql_fetch_array($res)) {
    if (
        !sql_query("UPDATE tf_revisions SET is_last=0 WHERE tf_id = ".$r['tf_id']) ||
        !sql_query("INSERT INTO tf_revisions VALUES (NULL, $revset_id, '".$r['tf_id']."', '".mysql_real_escape_string(generate_tf_rev($r['tf_text']))."', 1)")
    )
        print "error";
    else
        print "ok";
}

sql_commit();
?>
