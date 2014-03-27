<?php
require('lib/header.php');
$res = sql_query("select sent_id, source from sentences where (source like '%подробнее%' OR source LIKE '%читайте%') AND par_id in (select par_id from paragraphs where book_id in (select book_id from books where parent_id IN (226, 1)));");
while ($r = sql_fetch_array($res)) {
    printf("<p><a href='/sentence.php?id=%d'>%d</a>. %s</p>", $r[0], $r[0], $r[1]);
}
