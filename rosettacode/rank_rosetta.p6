#!/usr/bin/env perl6

use HTTP::UserAgent;
use JSON::Tiny;

.say for
    mediawiki-query('http://rosettacode.org/mw', 'pages',
                    generator => 'categorymembers',
                    gcmtitle  => "Category:Programming Languages",
                    prop      => 'categoryinfo')\
 
    .map({ .<categoryinfo><pages> || 0,
           .<title>.subst(/^'Category:'/, '') })\
 
    .sort(-*[0])\
 
    .map({ sprintf "%3d. %3d - %s", ++$, @$_ });

sub mediawiki-query ($site, $type, *%query) {
    my $url = "$site/api.php?" ~ uri-query-string(
        :action<query>, :format<json>, :gcmlimit<350>, :rawcontinue(), |%query);
    my $continue = '';
    my $client = HTTP::UserAgent.new;
 
    gather loop {
        my $response = $client.get("$url&$continue");
 
        my $data = from-json($response.content);
        take $_ for $data.<query>.{$type}.values;
 
        $continue = uri-query-string |($data.<query-continue>{*}».hash.hash or last);
    }
}

sub uri-query-string (*%fields) {
    %fields.map({ "{.key}={uri-encode .value}" }).join("&")
}

sub uri-encode ($str) {
    $str.subst(/<[\x00..\xff]-[a..zA..Z0..9_.~-]>/, *.ord.fmt('%%%02X'), :g)
}
