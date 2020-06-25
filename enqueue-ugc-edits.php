<?php

if (php_sapi_name() != 'cli')
    die("This script is for CLI only");

set_include_path(get_include_path().PATH_SEPARATOR.'/corpus');
require_once('lib/header_ajax.php');
require_once('lib/lib_dict.php');
require_once('lib/Lexeme.php');
main();

function main() {
    sql_begin();
    $res = sql_query("
       select rev_id, rev_text, lemma_id from dict_revisions where ugc_rev_id > 0
    ");
    foreach (sql_fetchall($res) as $row) {
        echo "{$row['lemma_id']} / {$row['rev_id']}\n";
        $new_lex = new Lexeme($row['rev_text']);
        $updated_forms = [];
        $res1 = sql_pe("
            SELECT rev_text
            FROM dict_revisions
            WHERE lemma_id = ?
            AND rev_id < ?
            ORDER BY rev_id DESC
            LIMIT 1
        ", array($row['lemma_id'], $row['rev_id']));
        if (sizeof($res1) > 0) {
            $old_lex = new Lexeme($res1[0]['rev_text']);
            $updated_forms = calculate_updated_forms($old_lex, $new_lex);
            //print_r($updated_forms);
        } else {
            //echo "this is a new lexeme\n";
            $updated_forms = $new_lex->get_all_forms_texts();
            //print_r($updated_forms);
        }

        if (sizeof($updated_forms) > 0) {
            enqueue_updated_forms($updated_forms, $row['rev_id']);
        }
    }
    sql_commit();
}
