<?php
exit();
require('lib/header.php');
require('lib/lib_xml.php');
require('lib/lib_annot.php');
require('lib/lib_dict.php');
print "<meta http-equiv=\"refresh\" content=\"3\"/>";
if (is_admin()) {
    sql_begin();
    $revset_id = 2956;
    $res = sql_query("SELECT tf_id, sent_id, tf_text FROM text_forms WHERE tf_id NOT IN (SELECT * FROM new_dict) ORDER BY tf_id LIMIT 1000");
    while ($r = sql_fetch_array($res)) {
        $new_rev = generate_tf_rev($r['tf_text']);
        print $r['tf_id']."<br/>";
        if (
            !sql_query("INSERT INTO `tf_revisions` VALUES(NULL, '$revset_id', '".$r['tf_id']."', '".mysql_real_escape_string($new_rev)."')", 0, 1) ||
            !sql_query("UPDATE sentences SET check_status=0 WHERE sent_id = ".$r['sent_id']." LIMIT 1", 0, 1) ||
            !sql_query("INSERT INTO new_dict VALUES(".$r['tf_id'].")", 0, 1)
        )
            die ("Internal error: Cannot save");
    }
    sql_commit();
    print $r['tf_id'];
}
?>
