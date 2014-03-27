#!/usr/bin/env python2
# -*- coding: utf8 -*-
import sys
sys.path.append('/corpus/python')
from Annotation import AnnotationEditor, Lexeme

def process(filename, editor):
    with open(filename) as f:
        for l in f:
            word = l.strip()
            lex = Lexeme(word, 0, None, editor)
            lex.lemma['gram'].append('ADVB')
            lex.add_form(word.lower(), [])
            lex.save("Add some missing adverbs")

def main():
    editor = AnnotationEditor('/corpus/config.ini')
    process(sys.argv[1], editor)
    editor.commit()

if __name__ == "__main__":
    main()
