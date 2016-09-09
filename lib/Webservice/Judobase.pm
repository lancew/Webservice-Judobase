package Webservice::Judobase;
use strict;
use warnings;


# ABSTRACT: This module wraps the www.judobase.org website API.
# VERSION

use Moo;
require HTTP::Request;
require LWP::UserAgent;

use Webservice::Judobase::Competitor;

use namespace::clean;

has 'url' => (
    is      => 'ro',
    default => 'http://data.judobase.org/api/',
);

has 'competitor' => (
    is      => 'ro',
    default => sub { return Webservice::Judobase::Competitor->new },
);

sub status {
    my ($self)    = @_;
    my $ua      = LWP::UserAgent->new;
    my $request = HTTP::Request->new( GET => $self->url );

    my $response = $ua->request($request);

    return $response->code == 200 ? 1 : 0;
}

1;
