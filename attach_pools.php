<?php
require('lib/header.php');
require('lib/lib_annot.php');

if (!is_admin())
    return;

$res = sql_query("SELECT pool_id, grammemes FROM morph_annot_pools");
while ($r = sql_fetch_array($res)) {
    $r1 = sql_fetch_array(sql_query("SELECT type_id FROM morph_annot_pool_types WHERE grammemes='".$r['grammemes']."'"));
    if (!sql_query("UPDATE morph_annot_pools SET pool_type=".$r1['type_id']." WHERE pool_id=".$r['pool_id']))
        die("Error");
}
print "ok";
