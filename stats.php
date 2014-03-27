<?php
require('lib/header.php');
header("Content-type: text/plain");
require_once('lib/lib_stats.php');
$stats = get_user_stats();
/*
print "user_id\tuser_name\ttotal\trating\tin full pools\tdivergence\tmoderated\terror %\n";
foreach ($stats['annotators'] as $user) {
    printf("%d\t%s\t%d\t%d\t%d\t%.4f\t%d\t%.4f\n",
        $user['user_id'],
        $user['fin']['user_name'],
        str_replace(' ', '', $user['total']),
        str_replace(' ', '', $user['rating']),
        str_replace(' ', '', $user['fin']['value']),
        $user['fin']['divergence'],
        str_replace(' ', '', $user['fin']['moderated']),
        $user['fin']['error_rate']
    );
}
*/

/*
print "team_id\tteam_name\tteam_size\ttotal\tmoderated\tcorrect\terror %\n";
foreach ($stats['teams'] as $id => $team) {
    printf("%d\t%s\t%d\t%d\t%d\t%d\t%.4f\n",
        $id,
        $team['name'],
        $team['active_users'],
        $team['total'],
        $team['moderated'],
        $team['correct'],
        $team['error_rate']
    );
}
*/

#print_r($stats['added_sentences']);
print "user_name\ttotal\n";
foreach ($stats['added_sentences'] as $user) {
    printf("%s\t%d\n", $user['user_name'], $user['value']);
}
