<?php
exit;
require_once('lib/header.php');

//$arr = file('/home/grand/news_2011_08_29.txt');
$arr = file('/corpus/lj-posts-random-100.txt');

foreach ($arr as $s) {
    list($p, $year, $month, $url) = explode("\t", $s);
    //$url = 'http://www.chaskor.ru/news/'.$url;
    $url = 'http://'.$url;
    if (!sql_query("INSERT INTO sources VALUES(NULL, '17674', '".mysql_real_escape_string(trim($url))."', '', '0', '0')")) {
        print "Fail!<br/>";
    }
}
print "ok";
?>
