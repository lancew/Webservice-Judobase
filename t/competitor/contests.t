use Test2::Bundle::Extended -target => 'Webservice::Judobase';

subtest no_params => sub {
    my $api = $CLASS->new();

    my $contests = $api->competitor->best_contests;

    is $contests,
        { error => 'id parameter is required' },
        'Returns error if no ID provided.';
};

subtest valid_params => sub {
    my $api = $CLASS->new();

    my $contests = $api->competitor->best_contests( id => 385 );

    is $contests,
        {},
        'Returns data structure for valid competitor';
};

subtest invalid_params => sub {
    my $api = $CLASS->new();

    my $contests = $api->competitor->best_contests( id => 0 );

    is $contests,
        { error => 'info.error.id_person_not_given', },
        'Returns error for invalid or not found competitor';
};

done_testing;
