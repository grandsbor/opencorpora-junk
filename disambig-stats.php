<?php

if (php_sapi_name() != 'cli')
    die("This script is for CLI only");

set_include_path(get_include_path().PATH_SEPARATOR.'/corpus');
require_once('lib/header_ajax.php');
require_once('lib/lib_annot.php');

main();


function main() {
    $res = sql_query("
        SELECT
            COUNT(sent_id) AS num_sentences,
            SUM(num_tokens) AS num_tokens,
            type
        FROM (
            SELECT
                T1.sent_id,
                num_tokens,
                (CASE WHEN num_unkn = 1
                    THEN (CASE WHEN MAX(form2lemma.lemma_id) > 0 THEN \"UNKN_dict\" ELSE \"UNKN_nodict\" END)
                    ELSE (CASE WHEN MAX(mp.pool_id) > 0
                        THEN (CASE
                                WHEN MIN(mp.status) = ".MA_POOLS_STATUS_IN_PROGRESS."
                                    THEN \"AMBIG_pools_annotation\"
                                WHEN MIN(mp.status) BETWEEN ".MA_POOLS_STATUS_ANSWERED." AND ".MA_POOLS_STATUS_MERGING."
                                    THEN \"AMBIG_pools_moderation\"
                                ELSE \"AMBIG_pools_inactive\"
                            END)
                        ELSE \"AMBIG_nopools\"
                    END)
                END) AS type
            FROM (
                SELECT sentences.sent_id,
                    SUM(tfr.rev_text LIKE '%/v><v%') AS num_ambiguous,
                    SUM(tfr.rev_text LIKE '%\"UNKN\"%') AS num_unkn,
                    COUNT(tokens.tf_id) AS num_tokens,
                    MAX(tokens2.tf_id) AS unkn_token_id,
                    MAX(tokens3.tf_id) AS ambig_token_id
                FROM sentences
                LEFT JOIN tokens USING (sent_id)
                LEFT JOIN tf_revisions tfr
                    ON (tokens.tf_id = tfr.tf_id AND tfr.is_last = 1)
                JOIN paragraphs USING (par_id)
                LEFT JOIN tokens AS tokens2
                    ON (tfr.rev_text LIKE '%\"UNKN\"%' AND tfr.tf_id = tokens2.tf_id)
                LEFT JOIN tokens AS tokens3
                    ON (tfr.rev_text LIKE '%/v><v%' AND tfr.tf_id = tokens3.tf_id)
                WHERE book_id < 3528
                GROUP BY sentences.sent_id
                HAVING (num_ambiguous = 1 AND num_unkn = 0)
                    OR (num_unkn = 1 AND num_ambiguous = 0)
            ) T1
            LEFT JOIN tokens
                ON (num_unkn = 1 AND T1.unkn_token_id = tokens.tf_id)
            LEFT JOIN form2lemma
                ON (num_unkn = 1 AND tokens.tf_text = form2lemma.form_text)
            LEFT JOIN morph_annot_samples ms
                ON (num_ambiguous = 1 AND T1.ambig_token_id = ms.tf_id)
            LEFT JOIN morph_annot_pools mp
                USING (pool_id)
            GROUP BY sent_id
        ) T2
        GROUP BY type
    ");
    $data = array();
    while ($row = sql_fetch_array($res)) {
        //print_r($row);
        $data[$row["type"]] = [$row["num_sentences"], $row["num_tokens"]];
    }
    print_r($data);
}
