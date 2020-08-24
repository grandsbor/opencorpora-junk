#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from os.path import abspath, dirname, join
#root = join(dirname(abspath(sys.argv[0])), "..")
root = '/corpus'
sys.path.append(join(root, 'python'))
from Annotation import AnnotationEditor, Lexeme

CONFIG_PATH = join(root, "config.ini")


def get_main_form(lex):
    for f in lex.forms:
        if f['gram'] == ['sing', 'nomn']:
            return f['text']
    assert False


def do_change(editor):
    data = editor.find_lexeme_by_lemma(['%вна', '%вич'], ['Patr'], True)
    for lex in data:
        main = get_main_form(lex)
        if main != lex.lemma['text']:
            lex.lemma['text'] = main
            lex.updated_forms.update(set([x['text'] for x in lex.forms]))
            lex.save("Fix lemma for some patronyms, issue #845")


def update_lemmata(editor):
    rows = editor.sql("SELECT rev_id, lemma_id, rev_text FROM dict_revisions WHERE set_id = 23075", True)
    for row in rows:
        lex = Lexeme("", row["lemma_id"], row["rev_text"], editor)
        #editor.sql("UPDATE dict_lemmata SET lemma_text = '{}' WHERE lemma_id = {} LIMIT 1".format(lex.lemma['text'].encode('utf-8'), row['lemma_id']))
        #for form in set([x['text'] for x in lex.forms]):
        #    editor.sql("""
        #        INSERT INTO updated_forms VALUES('{0}', {1})
        #    """.format(form.encode('utf-8'), row["rev_id"]))

def main():
    editor = AnnotationEditor(CONFIG_PATH)
    #do_change(editor)
    update_lemmata(editor)
    #editor.commit()


if __name__ == "__main__":
    main()
