#!/usr/bin/env perl
use strict;
use utf8;
use DBI;
use Encode;
use Config::INI::Reader;

#reading config
my $conf = Config::INI::Reader->read_file($ARGV[0]);
$conf = $conf->{mysql};

my $dbh = DBI->connect('DBI:mysql:'.$conf->{'dbname'}.':'.$conf->{'host'}, $conf->{'user'}, $conf->{'passwd'}) or die $DBI::errstr;
$dbh->do("SET NAMES utf8");
$dbh->{'AutoCommit'} = 0;
if ($dbh->{'AutoCommit'}) {
    die "Setting AutoCommit failed";
}

my $new_rev = $dbh->prepare("INSERT INTO rev_sets VALUES(NULL, ".time().", 1, 'Delete bad links (see issue 325)')");
$new_rev->execute();
my $revset_id = $dbh->{'mysql_insertid'};

my $scan = $dbh->prepare("SELECT * FROM dict_links WHERE link_type=1");
my $check = $dbh->prepare("SELECT rev_text FROM dict_revisions WHERE lemma_id=? AND rev_text NOT LIKE '%ADJS%'");
my $add_rev = $dbh->prepare("INSERT INTO dict_links_revisions VALUES(NULL, ?, ?, ?, 1, 0)");
my $drop_link = $dbh->prepare("DELETE FROM dict_links WHERE link_id=? LIMIT 1");

$scan->execute();
while (my $ref = $scan->fetchrow_hashref()) {
    printf "%d\t%d\n", $ref->{'lemma1_id'}, $ref->{'lemma2_id'};
    $check->execute($ref->{'lemma1_id'});
    my $l1 = $check->fetchrow_hashref();
    $check->execute($ref->{'lemma2_id'});
    my $l2 = $check->fetchrow_hashref();
    if ($l1 && $l2) {
        print "delete\n";
        $add_rev->execute($revset_id, $ref->{'lemma1_id'}, $ref->{'lemma2_id'});
        $drop_link->execute($ref->{'link_id'});
    }
}

$dbh->commit();
