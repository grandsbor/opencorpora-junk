<?php
exit;
require_once('lib/header.php');
if (!is_admin())
    exit;

$arr = file('/home/grand/2014_articles.txt');

$ins = sql_prepare("INSERT INTO sources VALUES(NULL, ?, ?, '', '0', '0')");
foreach ($arr as $s) {
    list($url, $date) = explode("\t", $s);
    //$url = 'http://www.chaskor.ru/news/'.$url;
    $url = 'http://'.$url;
    sql_execute($ins, array(20080, trim($url)));
}
print "ok";
?>
