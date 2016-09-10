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
    is      => 'ro',
    default => 'http://data.judobase.org/api/',
);

sub best_results {
    my $self = shift;
    my %args = @_;

    return { error => 'id parameter is required' } unless defined $args{id};
    my $url
        = $self->url
        . 'get_json?params[action]=competitor.best_results&params[id_person]='
        . $args{id};

    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new( GET => $url );

    my $response = $ua->request($request);

    return decode_json $response->content
        if $response->code == 200;

    return { error => 'Error retreiving competitor info' };
}

sub birthdays_competitors {
    my $self = shift;
    my %args = @_;

    return { error => 'min_age parameter is required' }
        unless defined $args{min_age};
    my $url
        = $self->url
        . 'get_json?params[action]=competitor.birthday_competitors&params[min_age]='
        . $args{min_age};

    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new( GET => $url );

    my $response = $ua->request($request);

    return decode_json $response->content
        if $response->code == 200;

    return { error => 'Error retreiving competitor info' };
}

sub contests {
    my $self = shift;
    my %args = @_;

    return { error => 'id parameter is required' } unless defined $args{id};
    my $url
        = $self->url
        . 'get_json?params[action]=competitor.contests&params[id_person]='
        . $args{id};

    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new( GET => $url );

    my $response = $ua->request($request);

    return decode_json $response->content
        if $response->code == 200;

    return { error => 'Error retreiving competitor info' };

}

sub contests_statistics {
    my $self = shift;
    my %args = @_;

    return { error => 'id parameter is required' } unless defined $args{id};
    my $url
        = $self->url
        . 'get_json?params[action]=competitor.contests_statistics&params[id_person]='
        . $args{id};

    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new( GET => $url );

    my $response = $ua->request($request);

    return decode_json $response->content
        if $response->code == 200;

    return { error => 'Error retreiving competitor contests statistics' };

}

sub info {
    my $self = shift;
    my %args = @_;

    return { error => 'id parameter is required' } unless defined $args{id};

    my $url
        = $self->url
        . 'get_json?params[action]=competitor.info&params[id_person]='
        . $args{id};

    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new( GET => $url );

    my $response = $ua->request($request);

    return decode_json $response->content
        if $response->code == 200;

    return { error => 'Error retreiving competitor info' };
}

1;
