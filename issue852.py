#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from os.path import abspath, dirname, join
root = '/corpus'
sys.path.append(join(root, 'python'))
from Annotation import AnnotationEditor, Lexeme

CONFIG_PATH = join(root, "config.json")

ADDED_FORMS = [
    ('е', ('plur', 'nomn')),
    ('ые', ('plur', 'nomn')),
    ('х', ('plur', 'gent')),
    ('ых', ('plur', 'gent')),
    ('м', ('plur', 'datv')),
    ('ым', ('plur', 'datv')),
    ('е', ('inan', 'plur', 'accs')),
    ('ые', ('inan', 'plur', 'accs')),
    ('х', ('anim', 'plur', 'accs')),
    ('ых', ('anim', 'plur', 'accs')),
    ('ми', ('plur', 'ablt')),
    ('ыми', ('plur', 'ablt')),
    ('х', ('plur', 'loct')),
    ('ых', ('plur', 'loct')),
]


def add_plural(editor):
    lemma_texts = map(str, [x for x in range(1, 21) if x != 3] + [x * 10 for x in range (3, 10)])
    for lemma_text in lemma_texts:
        lexeme = editor.find_lexeme_by_lemma("{}-й".format(lemma_text))[0]
        print(lexeme.get_id())
        for (flex, gram) in ADDED_FORMS:
            lexeme.add_form('{}-{}'.format(lemma_text, flex), gram)
        #print(lexeme.forms)
        lexeme.save('+plur (issue 852)')


def main():
    editor = AnnotationEditor(CONFIG_PATH)
    add_plural(editor)
    editor.commit()


if __name__ == "__main__":
    main()
