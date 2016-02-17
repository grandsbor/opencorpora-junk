<?php
exit;
require_once('lib/header.php');
if (!is_admin())
    exit;

$arr = file('/home/grand/all_news.txt');

$ins = sql_prepare("INSERT INTO sources VALUES(NULL, ?, ?, '', '0', '0')");
foreach ($arr as $s) {
    if (mb_substr($s, 0, 7) == "article")
        continue;
    $url = 'http://www.chaskor.ru/'.$s;
    //print "|$url|\n";
    sql_execute($ins, array(24432, trim($url)));
}
print "ok";
?>
