use Test2::Bundle::Extended -target => 'Webservice::Judobase';

subtest url => sub {
    my $api = $CLASS->new();

    my $url = $api->url;

    is $url, 'http://data.judobase.org/api/', 'Returns the correct default url';
};

subtest status => sub {
    my $api = $CLASS->new();

    my $status = $api->status;

    is $status, 0, 'Returns the correct default url';
};

done_testing;