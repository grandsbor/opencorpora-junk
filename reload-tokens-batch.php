<?php
require('lib/header.php');
require_once('lib/lib_dict.php');

//die("Script disabled");

if (!is_admin()) {
    return;
}

try {
    sql_begin();
    $revset_id = current_revset("Reparse some tokens corrupted by problem from issue #891");
    foreach (file('/tmp/tokens-for-reload-issue892-p2.txt') as $token_id) {
        $res = sql_pe("SELECT tf_text FROM tokens WHERE tf_id=? LIMIT 1", array($token_id));
        $token_text = $res[0]['tf_text'];
        $parse = new MorphParseSet(false, $token_text);
        $new_rev = $parse->to_xml();
        create_tf_revision($revset_id, $token_id, $new_rev);
    }
    sql_commit();
} catch (Exception $e) {
    exit("Error");
}
