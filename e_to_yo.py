#!/usr/bin/env python2
# -*- coding: utf8 -*-
import sys
sys.path.append('/corpus/python')
from Annotation import AnnotationEditor


def find_prefix(current, target):
    current = current.decode('utf-8')
    target = target.decode('utf-8')
    assert len(current) == len(target)
    idx = len(current) - 1
    while current[idx] == target[idx] and idx > 0:
        idx = idx - 1
    return current[:idx + 1], target[:idx + 1]


def process(filename, editor):
    with open(filename) as f:
        for l in f:
            current, target = l.strip().decode('utf-8').lower().encode('utf-8').split(',')
            assert(current != target)
            lex = editor.find_lexeme_by_lemma(current, "ADJF")
            if lex and len(lex) == 1:
                #print("{}: ok".format(current))
                lex = lex[0]
                if False:
                    if target == lex.lemma['text']:
                        print("already done: {}".format(current))
                        continue
                    print("found [" + lex.lemma['text'] + "], id = " + str(lex.get_id()))
                    prefix_current, prefix_target = find_prefix(current, target)
                    print("change [{}]({}) to [{}]({})".format(prefix_current.encode('utf-8'), len(prefix_current), prefix_target.encode('utf-8'), len(prefix_target)))
                    lex.lemma['text'] = lex.lemma['text'].decode('utf-8').replace(prefix_current, prefix_target).encode('utf-8')
                    for form in lex.forms:
                        form['text'] = form['text'].decode('utf-8').replace(prefix_current, prefix_target).encode('utf-8')
                        lex.updated_forms.add(form['text'])
                #print(lex.to_xml())
                editor.sql("UPDATE dict_lemmata SET lemma_text = '{}' WHERE lemma_id = {} LIMIT 1".format(target, lex.get_id()))
                #lex.save('yo-fication in ADJF, see issue 493')
            else:
                print("{}: FOUND {}".format(current, len(lex)))

def main():
    editor = AnnotationEditor('/corpus/config.ini')
    process(sys.argv[1], editor)
    editor.commit()

if __name__ == "__main__":
    main()
