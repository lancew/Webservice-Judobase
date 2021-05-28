use Test2::V0 -target => 'Webservice::Judobase::Competitor';

subtest url => sub {
    my $api = $CLASS->new();

    my $url = $api->url;

    is $url, 'http://data.ijf.org/api/',
        'Returns the correct default url';
};

done_testing;
