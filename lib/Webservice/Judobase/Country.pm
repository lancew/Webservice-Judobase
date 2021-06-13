package Webservice::Judobase::Country;

use strict;
use warnings;

# ABSTRACT: This module wraps the www.judobase.org website API.
# VERSION

use HTTP::Request;
use JSON::Tiny 'decode_json';
use Moo;

#extends 'Webservice::Judobase';
use namespace::clean;

has 'ua' => (
    is       => 'ro',
    required => 1,
);

has 'url' => (
    is       => 'ro',
    required => 1,
);


sub get_list {
    my ( $self, %args ) = @_;
    my $url
        = $self->url
        . '?params[action]=country.get_list';

    my $request = HTTP::Request->new( GET => $url );

    my $response = $self->ua->request($request);

    if ( $response->code == 200 ) {
        my $data = decode_json $response->content;

        return $data;
    }

    return { error => 'Error retreiving competitor info' };
}



1;