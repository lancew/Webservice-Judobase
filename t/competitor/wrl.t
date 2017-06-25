use Test2::Bundle::Extended -target => 'Webservice::Judobase';

subtest no_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->wrl_current;

    is $result,
        { error => 'id parameter is required' },
        'Returns error if no ID provided.';
};

subtest valid_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->wrl_current( id => 385 );

    is $result,
        {
        points         => 2100,
        place          => 3,
        id_weight      => 7,
        age            => 'Seniors',
        weight         => '+100',
        ogq_place      => 1,
        ogq_sum_points => 3150,
        q_status       => 1,
        },
        'Returns data structure for valid competitor';
};

subtest invalid_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->wrl_current( id => 0 );

    is $result,
        { error => 'wrl.error.id_person_not_given', },
        'Returns error for invalid or not found competitor';
};

done_testing;
