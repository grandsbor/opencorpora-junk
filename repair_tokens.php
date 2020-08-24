<?php
require('lib/header.php');
require_once('lib/lib_annot.php');

die("Script disabled");

if (!is_admin()) {
    return;
}

sql_begin();
if (sql_query("INSERT INTO `rev_sets` VALUES(NULL, '".time()."', '0', 'add new token type HANI, see issue 873')")) {
    $revset_id =  sql_insert_id();
}
else
    die("failed to create revset");

$res = sql_query("select tf_id, tf_text, rev_id FROM tokens RIGHT JOIN tf_revisions USING (tf_id) WHERE is_last=1 AND rev_text LIKE '%\"UNKN\"%'");
while ($r = sql_fetch_array($res)) {
    if (preg_match('/^[\p{Hiragana}\p{Katakana}]+$/u', $r['tf_text'])) {
    //if (!preg_match('/^\p{S}+$/u', $r['tf_text'])) {
        $parse = new MorphParseSet('', $r['tf_text']);
        print htmlspecialchars($r['tf_text']).'<br/>';
        print htmlspecialchars($parse->to_xml()).'<br/>';
        //sql_query("UPDATE tf_revisions SET is_last=0 WHERE rev_id = ".$r['rev_id']." LIMIT 1");
        //sql_query("INSERT INTO tf_revisions VALUES (NULL, '$revset_id', '".$r['tf_id']."', '".$parse->to_xml()."', 1)");
    }
}

//sql_commit();
print "ok";
