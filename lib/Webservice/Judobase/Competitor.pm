use strict;
use warnings;
package Webservice::Judobase::Competitor;

# ABSTRACT: This module wraps the www.judobase.org website API.
# VERSION

use HTTP::Request;
use JSON::Tiny 'decode_json';
use LWP::UserAgent;
use Moo;

#extends 'Webservice::Judobase';
use namespace::clean;

has 'url' => (
    is => 'ro',
    default => 'http://data.judobase.org/api/',
);

sub best_results {
    my $self = shift;
    my %args = @_;

    return {error => 'id parameter is required'} unless defined $args{id};
    my $url = $self->url
              . 'get_json?params[action]=competitor.best_results&params[id_person]='
              . $args{id};

    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new(GET => $url);

    my $response = $ua->request($request);

    return decode_json $response->content
        if $response->code == 200;

    return {error => 'Error retreiving competitor info'}    
}

sub info {
    my $self = shift;
    my %args = @_;

    return {error => 'id parameter is required'} unless defined $args{id};

    my $url = $self->url
              . 'get_json?params[action]=competitor.info&params[id_person]='
              . $args{id};

    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new(GET => $url);

    my $response = $ua->request($request);

    return decode_json $response->content
        if $response->code == 200;

    return {error => 'Error retreiving competitor info'}    
}


1;
