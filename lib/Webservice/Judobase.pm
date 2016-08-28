use strict;
use warnings;
package Webservice::Judobase;
# ABSTRACT: This module wraps the www.judobase.org website API.
# VERSION

use Moo;
require HTTP::Request;
require LWP::UserAgent;

use namespace::clean;

has 'url' => (
    is => 'ro',
    default => 'http://data.judobase.org/api/',
);

sub status {
    my $self = shift;
    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new(GET => $self->url);

    my $response = $ua->request($request);

    return $response->code == 200 ? 1: 0;
}

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
