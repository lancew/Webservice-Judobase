package Webservice::Judobase::Contests;

use strict;
use warnings;

# VERSION

use Moo;
use HTTP::Request;
use JSON::Tiny 'decode_json';
use LWP::UserAgent;

use namespace::clean;

has 'url' => (
    is      => 'ro',
    default => 'http://data.ijf.org/api/get_json',
);

has 'ua' => (
  is => 'lazy',
  default => sub{
    my $ua = LWP::UserAgent->new;
    $ua->agent("WebServiceJudobase/0.1 ");
    return $ua;
  },
);

sub competition {
    my ( $self, %args ) = @_;
    return { error => 'id parameter is required' }
      unless defined $args{id};

    my $url =
        $self->url
      . '?params[action]=contest.find'
      . '&params[id_weight]=0'
      . '&params[order_by]=cnum'
      . '&params[limit]=9999'
      . '&params[id_competition]='
      . $args{id};

    
    my $request = HTTP::Request->new( GET => $url );

    my $response = $self->ua->request($request);

    return decode_json( $response->content )->{contests}
      if $response->code == 200;

    return { error => 'Error retreiving competitor info' };
}

sub contest {
    my ( $self, %args ) = @_;
    return { error => 'id parameter is required' }
      unless defined $args{id};

    # https://data.ijf.org/api/get_json?access_token=&params[action]=contest.find&params[__ust]=&params[contest_code]=wc_sen2019_m_0060_0010&params[part]=info,score_list,media,events


    my $url =
        $self->url
      . '?params[action]=contest.find'
      . '&params[part]=info,score_list,media,events'
      . '&params[contest_code]='
      . $args{id};


    my $request = HTTP::Request->new( GET => $url );

    my $response = $self->ua->request($request);

    return decode_json( $response->content )->{contests}
      if $response->code == 200;

    return { error => 'Error retreiving contest info' };
}

1;
