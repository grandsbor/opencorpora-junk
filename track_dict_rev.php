<?php
require('lib/header.php');
require_once('lib/lib_dict.php');

die("Script disabled");

if (!is_admin()) {
    return;
}

sql_begin();

$res = sql_query("SELECT lemma_id, lemma_text, rev_id, rev_text from dict_revisions LEFT JOIN dict_lemmata USING (lemma_id) WHERE rev_id >= 388470 ORDER BY rev_id");
while ($r = sql_fetch_array($res)) {
    $new_xml = $r['rev_text'];
    $r1 = sql_fetch_array(sql_query("SELECT * FROM dict_revisions WHERE lemma_id = ".$r['lemma_id']." AND rev_id < ".$r['rev_id']." ORDER BY rev_id DESC LIMIT 1"));
    if ($r1)
        $old_xml = $r1['rev_text'];
    else {
        $old_xml = false;
    }

    $upd = array();

    // lemma deleted
    if ($old_xml && !$new_xml) {
        print "deleted ".$r['lemma_text'].': ';
        $par = parse_dict_rev($old_xml);
        foreach ($par['forms'] as $form) {
            $upd[] = $form['text'];
        }
    }
    // lemma added
    elseif (!$old_xml && $new_xml) {
        print "added ".$r['lemma_text'].': ';
        $par = parse_dict_rev($new_xml);
        foreach ($par['forms'] as $form) {
            $upd[] = $form['text'];
        }
    }
    // lemma changed
    else {
        print "changed ".$r['lemma_text'].': ';
        $old = parse_dict_rev($old_xml);
        $lemma_gram_old = implode(', ', $old['lemma']['grm']);
        $new = parse_dict_rev($new_xml);
        $lemma_gram_new = implode(', ', $new['lemma']['grm']);
        if ($lemma_gram_old != $lemma_gram_new ||
            $old['lemma']['text'] != $new['lemma']['text']) {
            // all forms changed
            foreach ($old['forms'] as $form) {
                $upd[] = $form['text'];
            }
            foreach ($new['forms'] as $form) {
                $upd[] = $form['text'];
            }
        }
        else {
            $old_par = array();
            $new_par = array();
            foreach ($old['forms'] as $form) {
                $old_par[] = array($form['text'], implode(',', $form['grm']));
            }
            foreach ($new['forms'] as $form) {
                $new_par[] = array($form['text'], implode(',', $form['grm']));
            }
            $diff = paradigm_diff($old_par, $new_par);
            foreach ($diff as $form) {
                $upd[]=  $form[0];
            }
        }
    }

    $upd = array_unique($upd);
    foreach ($upd as $form) {
        if (!sql_query("INSERT INTO updated_forms VALUES ('".mysql_real_escape_string($form)."', ".$r['rev_id'].")"))
            die("error");
    }
}
sql_commit();
print "ok";


?>
