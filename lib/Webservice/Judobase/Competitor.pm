use strict;
use warnings;
package Webservice::Judobase::Competitor;

# ABSTRACT: This module wraps the www.judobase.org website API.
# VERSION

use Moo;
extends 'Webservice::Judobase';

require HTTP::Request;
require LWP::UserAgent;

use namespace::clean;

sub competitor {
    my $self = shift;
    my %args = @_;

    return {error => 'id parameter is required'} unless $args{id};

    my $url = $self->url
              . 'get_json?params[action]=competitor.info&params[id_person]='
              . $args{id};

    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new(GET => $url);

    my $response = $ua->request($request);


    use Data::Dumper;
    #warn Dumper $response;
    return {
        id    => 1,
        error => '',
    };
}


1;
