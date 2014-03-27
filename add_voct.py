#!/usr/bin/env python2
# -*- coding: utf8 -*-
import sys
sys.path.append('/corpus/python')
from Annotation import AnnotationEditor

def get_full_form(voct_form):
    if voct_form.endswith(('ь', 'й')):
        return voct_form[:-2] + 'я'
    else:
        return voct_form + 'а'

def process(filename, editor):
    with open(filename) as f:
        for l in f:
            voct_form = l.strip()
            full_form = get_full_form(voct_form)
            #print(voct_form + ' ' + full_form)
            lex = editor.find_lexeme_by_lemma(full_form, "Name")
            if lex and len(lex) == 1:
                lex = lex[0]
                print("found [" + lex.lemma['text'] + "], id = " + str(lex.get_id()))
                if not lex.has_form(voct_form, 'voct'):
                    lex.add_form(voct_form, ("sing", "voct", "Infr"))
                    lex.save("add voct (issue 385)")
            else:
                print("FOUND " + str(len(lex)))

def main():
    editor = AnnotationEditor('/corpus/config.ini')
    process(sys.argv[1], editor)
    editor.commit()

if __name__ == "__main__":
    main()
