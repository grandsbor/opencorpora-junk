<?php
require('lib/header.php');
require_once('lib/lib_dict.php');

die("Script disabled");

if (!is_admin()) {
    return;
}

$time = time();
if (sql_query("INSERT INTO `rev_sets` VALUES(NULL, '".time()."', '0', '".mysql_real_escape_string('Make phantom revisions for deleted lemmata')."')")) {
    $revset_id =  sql_insert_id();
}
else
    die("failed to create revset");

$res = sql_query("SELECT * FROM dict_lemmata_deleted");
while ($r = sql_fetch_array($res)) {
    if (!sql_query("INSERT INTO dict_revisions VALUES(NULL, $revset_id, ".$r['lemma_id'].", '', 1, 1)"))
        die("error");
}

sql_begin();
?>
