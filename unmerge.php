<?php
exit();
require('lib/header.php');
if (!is_admin())
    return false;

$pools = array(1, 2, 24, 27);
$sets = array(3299, 3300, 3301, 3302);

sql_begin();
foreach ($sets as $set) {
    print "set $set<br/>";
    $res = sql_query("SELECT tf_id FROM tf_revisions WHERE set_id=$set");
    while ($r = sql_fetch_array($res)) {
        print $r['tf_id']."<br/>";
        $r1 = sql_fetch_array(sql_query("SELECT rev_id FROM tf_revisions WHERE tf_id=".$r['tf_id']." AND is_last=0 ORDER BY set_id DESC LIMIT 1"));
        if (
            !sql_query("DELETE FROM tf_revisions WHERE tf_id=".$r['tf_id']." AND set_id=$set") ||
            !sql_query("UPDATE tf_revisions SET is_last=1 WHERE tf_id=".$r['tf_id']." AND rev_id=".$r1['rev_id']." LIMIT 1")
        )
            die("error");
    }
    sql_query("DELETE FROM rev_sets WHERE set_id=$set LIMIT 1") or die("error 2");
    print "<br/>";
}
foreach ($pools as $pool) {
    if (!sql_query("UPDATE morph_annot_pools SET status=7 WHERE pool_id=$pool LIMIT 1"))
        die("error 3");
}
sql_commit();

?>
