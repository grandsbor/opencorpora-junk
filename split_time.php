<?php
require('lib/header.php');
require_once('lib/lib_books.php');

$res = mysql_query("SELECT tf_id, tf_text FROM text_forms WHERE tf_text REGEXP '^-[0-9]{2}$'");
while ($r = mysql_fetch_row($res)) {
    print "$r[0] $r[1]";
    #if (!split_token($r[0], 1)) {
    #   print "failed :(";
    #    exit;
    #}
    print " ok<br/>\n";
}
?>
