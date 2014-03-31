# генерирование словоформ из шаблонов существительных
package get_form_noun;

use utf8; # чтобы регулярные выражения работали с кириллицей

1;

################################################################
################################################################
# --------------------------------------------------------
################################################################
################################################################

sub get_word_form_noun_m_ina_1a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_m_ina_1a";        # как обзывать файлы
    my $form_regexp = "сущ ru m ina 1a";    # название шаблона из викисловаря
    my $type = "NOUN,inan,masc";            # тип слова

    my $ends_sing = ",а,у,,ом,е";           # окончания един. числа
    my $ends_plur = "ы,ов,ам,ы,ами,ах";     # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_n_ina_7a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_n_ina_7a";        # как обзывать файлы
    my $form_regexp = "сущ ru n ina 7a";    # название шаблона из викисловаря
    my $type = "NOUN,inan,neut";            # тип слова

    my $ends_sing = "ие,ия,ию,ие,ием,ииx";  # окончания един. числа
    my $ends_plur = "ия,ий,иям,ия,иями,иях";# окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_f_ina_1a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_f_ina_1a";        # как обзывать файлы
    my $form_regexp = "сущ ru f ina 1a";    # название шаблона из викисловаря
    my $type = "NOUN,inan,femn";            # тип слова

    my $ends_sing = "а,ы,е,у,ой|ою,е";      # окончания един. числа
    my $ends_plur = "ы,,ам,ы,ами,ах";       # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_f_ina_7a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_f_ina_7a";        # как обзывать файлы
    my $form_regexp = "сущ ru f ina 7a";    # название шаблона из викисловаря
    my $type = "NOUN,inan,femn";            # тип слова

    my $ends_sing = "я,и,и,ю,ей|ею,и";      # окончания един. числа
    my $ends_plur = "и,й,ям,и,ями,ях";      # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_f_ina_8a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_f_ina_8a";        # как обзывать файлы
    my $form_regexp = "сущ ru f ina 8a";    # название шаблона из викисловаря
    my $type = "NOUN,inan,femn";            # тип слова

    my $ends_sing = "ь,и,и,ь,ью,и";         # окончания един. числа
    my $ends_plur = "и,ей,ям,и,ями,ях";     # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_m_a_1a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_m_a_1a";          # как обзывать файлы
    my $form_regexp = "сущ ru m a 1a";      # название шаблона из викисловаря
    my $type = "NOUN,anim,masc";            # тип слова

    my $ends_sing = ",а,у,а,ом,е";          # окончания един. числа
    my $ends_plur = "ы,ов,ам,ов,ами,ах";    # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_m_ina_3a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_m_ina_3a";          # как обзывать файлы
    my $form_regexp = "сущ ru m ina 3a";      # название шаблона из викисловаря
    my $type = "NOUN,inan,masc";            # тип слова

    my $ends_sing = ",а,у,,ом,е";          # окончания един. числа
    my $ends_plur = "и,ов,ам,и,ами,ах";    # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_m_a_3a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_m_a_3a";          # как обзывать файлы
    my $form_regexp = "сущ ru m a 3a";      # название шаблона из викисловаря
    my $type = "NOUN,anim,masc";            # тип слова

    my $ends_sing = ",а,у,а,ом,е";          # окончания един. числа
    my $ends_plur = "и,ов,ам,ов,ами,ах";    # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_m_ina_0 {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_m_ina_0";         # как обзывать файлы
    my $form_regexp = "сущ ru m ina 0";     # название шаблона из викисловаря
    my $type = "NOUN,inan,masc,Fixd";       # тип слова

    my $ends_sing = ",,,,,";                # окончания един. числа
    my $ends_plur = ",,,,,";                # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_n_ina_0 {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_n_ina_0";         # как обзывать файлы
    my $form_regexp = "сущ ru n ina 0";     # название шаблона из викисловаря
    my $type = "NOUN,inan,neut,Fixd";       # тип слова

    my $ends_sing = ",,,,,";                # окончания един. числа
    my $ends_plur = ",,,,,";                # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_f_ina_3a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_f_ina_3a";         # как обзывать файлы
    my $form_regexp = "сущ ru f ina 3a";     # название шаблона из викисловаря
    my $type = "NOUN,inan,femn";       # тип слова

    my $ends_sing = "а,и,е,у,ой|ою,е";                # окончания един. числа
    my $ends_plur = "и,,ам,и,ами,ах";                # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_n_ina_1a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_n_ina_1a";         # как обзывать файлы
    my $form_regexp = "сущ ru n ina 1a";     # название шаблона из викисловаря
    my $type = "NOUN,inan,neut";             # тип слова

    my $ends_sing = "о,а,у,о,ом,е";                # окончания един. числа
    my $ends_plur = "а,,ам,а,ами,ах";                # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_m_ina_2a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_m_ina_2a";         # как обзывать файлы
    my $form_regexp = "сущ ru m ina 2a";     # название шаблона из викисловаря
    my $type = "NOUN,inan,masc";             # тип слова

    my $ends_sing = "ь,я,ю,ь,ем,е";                # окончания един. числа
    my $ends_plur = "и,ей,ям,и,ями,ях";                # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_f_a_1a {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_f_a_1a";         # как обзывать файлы
    my $form_regexp = "сущ ru f a 1a";     # название шаблона из викисловаря
    my $type = "NOUN,anim,femn";             # тип слова

    my $ends_sing = "а,ы,е,у,ой|ою,е";                # окончания един. числа
    my $ends_plur = "ы,,ам,,ами,ах";                # окончания множ. числа
    
    get_word_form_noun($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}




################################################################
################################################################
################################################################
####   2 basics
################################################################
################################################################
################################################################




sub get_word_form_noun_m_a_5xa {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_m_a_5xa";         # как обзывать файлы
    my $form_regexp = "сущ ru m a 5*a";     # название шаблона из викисловаря
    my $type = "NOUN,anim,masc";            # тип слова

    my $ends_sing = ",1а,1у,1а,1ем,1е";           # окончания един. числа
    my $ends_plur = "1ы,1ев,1ам,1ев,1ами,1ах";    # окончания множ. числа
    
    get_word_form_noun2($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_f_ina_3xa {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_f_ina_3xa";         # как обзывать файлы
    my $form_regexp = "сущ ru f ina 3*a";     # название шаблона из викисловаря
    my $type = "NOUN,inan,femn";              # тип слова

    my $ends_sing = "а,и,е,у,ой|ою,е";        # окончания един. числа
    my $ends_plur = "и,1,ам,и,ами,ах";        # окончания множ. числа
    
    get_word_form_noun2($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_f_a_3xa {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_f_a_3xa";       # как обзывать файлы
    my $form_regexp = "сущ ru f a 3*a";     # название шаблона из викисловаря
    my $type = "NOUN,anim,femn";            # тип слова

    my $ends_sing = "а,и,е,у,ой|ою,е";      # окончания един. числа
    my $ends_plur = "и,1,ам,1,ами,ах";      # окончания множ. числа
    
    get_word_form_noun2($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}

sub get_word_form_noun_m_a_1oa {
    my ($diff_wiki, $dir, $unkn_text) = @_;

    my $form_name = "noun_m_a_1oa";       # как обзывать файлы
    my $form_regexp = "сущ ru m a 1°a";     # название шаблона из викисловаря
    my $type = "NOUN,anim,masc";            # тип слова

    my $ends_sing = ",а,у,а,ом,е";      # окончания един. числа
    my $ends_plur = "1е,1,1ам,1,1ами,1ах";      # окончания множ. числа
    
    get_word_form_noun2($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur);
}



################################################################
################################################################
################################################################
# --------------------------------------------------------------------
#
# --------------------------------------------------------------------
################################################################
################################################################
################################################################



sub get_word_form_noun {
    my ($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur) = @_;

    $form_regexp = quotemeta $form_regexp;
    
    my $full_name = $dir."form_".$form_name.".txt";
    my $diff_name = $dir."form_".$form_name."_unkn.txt";
    
    print("start form '$form_name' extract\n");
    
    # выделим словоформы с нужным шаблоном
    my %basics = get_basics($diff_wiki,$form_regexp);             
    
    # а теперь сохраним результаты    
    my $counter_a = get_noun_form_1_basic($full_name, $type, $ends_sing, $ends_plur, %basics);
    print("form '$form_name' extract A done! -> $counter_a\n");
    
    # и найдём пересечения с неизвестными словами из корпуса    
    my $counter_b = get_unkn_forms($unkn_text, $full_name, $diff_name);        
    print("form '$form_name' extract B done! -> $counter_b\n");
}

# работа с 2 основами
sub get_word_form_noun2 {
    my ($diff_wiki, $dir, $unkn_text, $form_name, $form_regexp, $type, $ends_sing, $ends_plur) = @_;

    $form_regexp = quotemeta $form_regexp;
    
    my $full_name = $dir."form_".$form_name.".txt";
    my $diff_name = $dir."form_".$form_name."_unkn.txt";
    
    print("start form '$form_name' extract\n");
    
    # выделим словоформы с нужным шаблоном
    my %basics = get_basics_2($diff_wiki,$form_regexp);             
    
    # а теперь сохраним результаты    
    my $counter_a = get_noun_form_2_basic($full_name, $type, $ends_sing, $ends_plur, %basics);
    print("form '$form_name' extract A done! -> $counter_a\n");
    
    # и найдём пересечения с неизвестными словами из корпуса    
    my $counter_b = get_unkn_forms($unkn_text, $full_name, $diff_name);        
    print("form '$form_name' extract B done! -> $counter_b\n");
}

# генерирует словоформы для существительных с одной основой
sub get_noun_form_1_basic {
    my ($full_name, $type, $ends_sing_s, $ends_plur_s, %basics) = @_;

    my @ends_sing = split(',', $ends_sing_s);
    my @ends_plur = split(',', $ends_plur_s);
    
    my @cases = qw/nomn gent datv accs ablt loct/;    # к счастью неизменно для всех существительных :)

    open (FILE_FORMS_FULL,">:utf8",$full_name) or die "fail $!\n";    
        my $counter = 0;                     # все словоформы таких слов
        foreach $basis (sort keys %basics) {
            $counter++;    
            print FILE_FORMS_FULL $counter."\n";
                for($x=0; $x<6; $x++) {     # sing
                    unless (@ends_sing[$x] =~ /^(.*)\|(.*)/) {     # если есть доп. окончание на "-ею" (напр. ей|ею)
                        print FILE_FORMS_FULL uc($basis.@ends_sing[$x])."\t".$type." sing,".@cases[$x]."\n"; 
                    } else {
                        print FILE_FORMS_FULL uc($basis.$1)."\t".$type." sing,".@cases[$x]."\n"; 
                        if ($2 eq "ею") {
                            print FILE_FORMS_FULL uc($basis."ею")."\t".$type." sing,".@cases[$x].",V-ey\n"; 
                        } elsif ($2 eq "ою") {
                            print FILE_FORMS_FULL uc($basis."ою")."\t".$type." sing,".@cases[$x].",V-oy\n"; 
                        }
                    }
                }
                for($x=0; $x<6; $x++) {     # plur
                    unless (@ends_plur[$x] =~ /^(.*)\|(.*)/) {     # если есть доп. окончание на "-ею"
                        print FILE_FORMS_FULL uc($basis.@ends_plur[$x])."\t".$type." plur,".@cases[$x]."\n"; 
                    } else {
                        print FILE_FORMS_FULL uc($basis.$1)."\t".$type." plur,".@cases[$x]."\n"; 
                        if ($2 eq "ею") {
                            print FILE_FORMS_FULL uc($basis."ею")."\t".$type." plur,".@cases[$x].",V-ey\n"; 
                        } elsif ($2 eq "ою") {
                            print FILE_FORMS_FULL uc($basis."ою")."\t".$type." plur,".@cases[$x].",V-oy\n"; 
                        }
                    }
                }
            print FILE_FORMS_FULL "\n";
        }       
    close(FILE_FORMS_FULL); 
    
    return $counter;
}

# генерирует словоформы для существительных с 2 основами
sub get_noun_form_2_basic {
    my ($full_name, $type, $ends_sing_s, $ends_plur_s, %basics) = @_;

    my @ends_sing = split(',', $ends_sing_s);
    my @ends_plur = split(',', $ends_plur_s);
    
    my @cases = qw/nomn gent datv accs ablt loct/;    # к счастью неизменно для всех существительных :)

    open (FILE_FORMS_FULL,">:utf8",$full_name) or die "fail $!\n";    
        my $basis = '';
        my $end = '';
        my $counter = 0;                     # все словоформы таких слов
        foreach $basis_o (sort keys %basics) {
            $counter++;    
            print FILE_FORMS_FULL $counter."\n";
                for($x=0; $x<6; $x++) {     # sing
                    if (@ends_sing[$x] =~ /1(.*)/) {
                        $basis = $basics{$basis_o};                        
                        $end = $1;
                    } else {
                        $basis = $basis_o;
                        $end = @ends_sing[$x];
                    }
                    
                    unless ($end =~ /^(.*)\|(.*)/) {     # если есть доп. окончание на "-ею" (напр. ей|ею)
                        print FILE_FORMS_FULL uc($basis.$end)."\t".$type." sing,".@cases[$x]."\n"; 
                    } else {
                        print FILE_FORMS_FULL uc($basis.$1)."\t".$type." sing,".@cases[$x]."\n"; 
                        if ($2 eq "ею") {
                            print FILE_FORMS_FULL uc($basis."ею")."\t".$type." sing,".@cases[$x].",V-ey\n"; 
                        } elsif ($2 eq "ою") {
                            print FILE_FORMS_FULL uc($basis."ою")."\t".$type." sing,".@cases[$x].",V-oy\n"; 
                        }
                    }
                }
                for($x=0; $x<6; $x++) {     # plur
                    if (@ends_plur[$x] =~ /1(.*)/) {
                        $basis = $basics{$basis_o};                        
                        $end = $1;
                    } else {
                        $basis = $basis_o;
                        $end = @ends_plur[$x];
                    }
                
                    unless ($end =~ /^(.*)\|(.*)/) {     # если есть доп. окончание на "-ею"
                        print FILE_FORMS_FULL uc($basis.$end)."\t".$type." plur,".@cases[$x]."\n"; 
                    } else {
                        print FILE_FORMS_FULL uc($basis.$1)."\t".$type." plur,".@cases[$x]."\n"; 
                        if ($2 eq "ею") {
                            print FILE_FORMS_FULL uc($basis."ею")."\t".$type." plur,".@cases[$x].",V-ey\n"; 
                        } elsif ($2 eq "ою") {
                            print FILE_FORMS_FULL uc($basis."ою")."\t".$type." plur,".@cases[$x].",V-oy\n"; 
                        }
                    }
                }
            print FILE_FORMS_FULL "\n";
        }       
    close(FILE_FORMS_FULL); 
    
    return $counter;
}

# получить основы слов из дампа вики по заданному регулярному выражению
sub get_basics {
    my ($diff_wiki,$form_regexp) = @_;    

    my $i = 0;  my $time = time;    # для подсчета прогресса
    my $ru_segment = 0;             # читается сейчас русский сегмент или нет
    my $template = 0;               # читается сейчас шаблон или нет
    my %basics = ();               # распознанные леммы
    
    open (FILE_WIKI,"<:utf8",$diff_wiki) or die "fail $!\n";
    
    while(my $line = <FILE_WIKI>) {
        $i++; if ($i % 1000 == 0 && ((time - $time) > 1)) { print("  wiki: ".$i." lines\n"); $time = time; }    # периодически выводить на экран текущий прогресс
        
        unless ( $line =~ /^\s*<comment>/) {                                        # если не начинается с тега '<comment>'
            if ( $line =~ /\{\{-(.+?)-\}\}/ ) { $ru_segment = ($1 eq "ru"); }       # search for {{-ru-}} segment, 0 or 1            
            if ($ru_segment && $line =~ /$form_regexp/ ) { $template = 1; }         # search for described form template    
            
            if ($template && $line =~ /основа=([[:word:]­\-́]+)/ && ($1 eq lc $1)) { # основа - буквенные символы + '-' (дефис) и нет слов с большой буквы!
                my $basis = $1; $basis =~ s/́//g;                                    # вырезаем символ ударения                
                unless (exists $basics{$basis}) { $basics{$basis}++; }              # защита от дублирования лемм
            }
            
            if ($line =~ /\}\}/ ) { $template = 0; }                                # end template section '}}'
        }
        
        if ( $line =~ /<\/page>/ ) { $ru_segment = 0; $template = 0; }              # если </page>, значит страница кончилась и пора обнулять переменные для новой страницы
    }
    
    close(FILE_WIKI); 
    
    return %basics;
}

# получить основы слов из дампа вики по заданному регулярному выражению
# рассчитано на работу с 2 основами
sub get_basics_2 {
    my ($diff_wiki,$form_regexp) = @_;    

    my $i = 0;  my $time = time;    # для подсчета прогресса
    my $ru_segment = 0;             # читается сейчас русский сегмент или нет
    my $template = 0;               # читается сейчас шаблон или нет
    my %basics = ();               # распознанные леммы
    
    open (FILE_WIKI,"<:utf8",$diff_wiki) or die "fail $!\n";
    
    my $basis0 = '';
    my $basis1 = '';
    while(my $line = <FILE_WIKI>) {
        $i++; if ($i % 1000 == 0 && ((time - $time) > 1)) { print("  wiki: ".$i." lines\n"); $time = time; }    # периодически выводить на экран текущий прогресс
        
        unless ( $line =~ /^\s*<comment>/) {                                        # если не начинается с тега '<comment>'
            if ( $line =~ /\{\{-(.+?)-\}\}/ ) { $ru_segment = ($1 eq "ru"); }       # search for {{-ru-}} segment, 0 or 1            
            if ($ru_segment && $line =~ /$form_regexp/ ) { $template = 1; }         # search for described form template    
            
            if ($template && $line =~ /основа=\s*([[:word:]­\-́]+)/ && ($1 eq lc $1)) { # основа - буквенные символы + '-' (дефис) и нет слов с большой буквы!
                $basis0 = $1; $basis0 =~ s/́//g;                                    # вырезаем символ ударения
            }
            if ($template && $line =~ /основа1=\s*([[:word:]­\-́]+)/ && ($1 eq lc $1)) { # основа - буквенные символы + '-' (дефис) и нет слов с большой буквы!
                $basis1 = $1; $basis1 =~ s/́//g;                                    # вырезаем символ ударения                
                unless (exists $basics{$basis0}) { $basics{$basis0} = $basis1; }               # защита от дублирования лемм
            }
            
            if ($line =~ /\}\}/ ) { $template = 0; }                                # end template section '}}'
        }
        
        if ( $line =~ /<\/page>/ ) { $ru_segment = 0; $template = 0; $basis0 = ''; $basis1 = ''}              # если </page>, значит страница кончилась и пора обнулять переменные для новой страницы
    }
    
    close(FILE_WIKI); 
    
    return %basics;
}


# выделить из полученных словоформ те, которые есть в списке неопознанных (UNKN) слов
sub get_unkn_forms {
    my ($unkn_file, $from, $to) = @_;

    %unkn = util::load_from_file($unkn_file);                    # список UNKN слов из пулов
    
    open (FILE_FORMS_FULL,"<:utf8",$from) or die "fail $!\n";    
    open (FILE_FORMS_DIFF,">:utf8",$to) or die "fail $!\n";   
    
    my $counter = 0;                     # счетчик кол-ва
    my $segment = 0;                     # читается ли сейчас сегмент данных
    my $save = 0;                        # сохранять ли прочитанный сегмент    
    my @data = ();                       # массив для прочитанного сегмента
    while(my $line = <FILE_FORMS_FULL>) {
        if ($segment) {
            $line =~ /^(.*?)\t/ ;            
            if (exists $unkn{lc $1}) { $save = 1; }
            
            push (@data, $line);
        }
        
        if ($line =~ /^\d+\n$/) { $segment = 1; }                # block begin, поставил после условия, т.к. нам не нужен старый номер :)
        
        if ($line =~ /^\n$/) {                                   # block end
            if ($save) {                                         # if success, copy block to another file
                $counter++;    
                print FILE_FORMS_DIFF $counter."\n"; 
                foreach (@data) { print FILE_FORMS_DIFF $_; }
            }
            $segment = 0;
            $save = 0;
            @data = ();
        }
    }    
    close(FILE_FORMS_FULL);
    close(FILE_FORMS_DIFF);
    
    return $counter;
}