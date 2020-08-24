#!/usr/bin/env python2
# -*- coding: utf8 -*-
import sys
sys.path.append('/corpus/python')
from Annotation import AnnotationEditor

EDITOR = AnnotationEditor('/corpus/config.ini')

def main():
    surnames = EDITOR.find_lexemes_by_gramset(['Surn', 'Fixd', 'Ms-f'])
    for sur in surnames:
        if not sur.has_all_gram(['anim', 'GNdr', 'NOUN']):
            raise Exception(sur.lemma['text'])
        # so odd because editor cannot sort grammemes properly
        #sur.remove_lemma_gram(['GNdr', 'Ms-f', 'Pltm', 'Surn'])
        #sur.add_lemma_gram(['ms-f', 'Pltm', 'Surn'])

        sur.remove_lemma_gram(['GNdr', 'Ms-f', 'Fixd', 'Surn'])
        sur.add_lemma_gram(['ms-f', 'Fixd', 'Surn'])
        sur.save('Replace GNdr+Ms-f -> ms-f for Fixd surnames, issue #795')
    EDITOR.commit()

if __name__ == "__main__":
    main()
