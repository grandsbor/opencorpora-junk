<?php

if (php_sapi_name() != 'cli')
    die("This script is for CLI only");

set_include_path(get_include_path().PATH_SEPARATOR.'/corpus');
require_once('lib/header_ajax.php');
require_once('lib/lib_dict.php');
require_once('lib/Lexeme.php');
main();


function main() {
    $res = sql_query("
        SELECT lemma_id, rev_text, lemma_text
        FROM dict_revisions dr
        LEFT JOIN dict_lemmata dl
            USING (lemma_id)
        WHERE is_last = 1
            AND rev_text LIKE '%g v=\"Patr\"%'
            AND rev_text NOT LIKE '%g v=\"Init\"%'
        ORDER BY lemma_text
    ");
    $prev = [NULL, NULL, NULL];
    $dups = array();
    foreach (sql_fetchall($res) as $row) {
        $lemma = $row["lemma_text"];
        $lexeme = new Lexeme($row["rev_text"]);
        //print "$lemma\n";
        if ($lemma == $prev[0]) {
            if (isset($dups[$lemma])) {
                $dups[$lemma][] = [(int)$row['lemma_id'], $lexeme];
            } else {
                $dups[$lemma] = array([$prev[1], $prev[2]], [$row['lemma_id'], $lexeme]);
            }
        }
        $prev = [$lemma, (int)$row["lemma_id"], $lexeme];
    }
    
    sql_begin();
    foreach ($dups as $dup_set) {
        $exit = process_set($dup_set);
        if ($exit) break;
    }
    sql_commit();
}

function process_set(array $dups) {
    $main = choose_main($dups);
    if ($main == -1) {
        // skip
        return false;
    } else if ($main == -2) {
        // break
        return true;
    }
    if (!in_array($main, array_column($dups, 0))) {
        throw new Exception();
    }

    $revset_id = current_revset("Remove duplicate patronyms, issue #812", 0);
    // move links
    foreach ($dups as $item) {
        $lemma_id = $item[0];
        if ($lemma_id != $main) {
            $res = sql_pe("
                SELECT lemma2_id, link_type
                FROM dict_links
                WHERE lemma1_id = ?
            ", array($lemma_id));
            foreach ($res as $row) {
                $res2 = sql_pe("
                    SELECT *
                    FROM dict_links
                    WHERE lemma1_id = ? AND lemma2_id = ? AND link_type = ?
                ", array($main, $row['lemma2_id'], $row['link_type']));
                if (sizeof($res2) == 0) {
                    add_link($main, $row['lemma2_id'], $row['link_type']);
                }
            }

            $res = sql_pe("
                SELECT lemma1_id, link_type
                FROM dict_links
                WHERE lemma2_id = ?
            ", array($lemma_id));
            foreach ($res as $row) {
                $res2 = sql_pe("
                    SELECT *
                    FROM dict_links
                    WHERE lemma1_id = ? AND lemma2_id = ? AND link_type = ?
                ", array($row['lemma1_id'], $main, $row['link_type']));
                if (sizeof($res2) == 0) {
                    add_link($row['lemma1_id'], $main, $row['link_type']);
                }
            }

            del_lemma($lemma_id);
        }
    }
}

function choose_main(array $dups) {
    print "-1 = skip, -2 = finish:\n";
    print "Choose from:\n";
    foreach ($dups as $item) {
        print "$item[0]\t\n".$item[1]->to_plain()."\n\n";
    }
    return (int)readline();
}
