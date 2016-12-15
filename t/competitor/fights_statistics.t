use Test2::Bundle::Extended -target => 'Webservice::Judobase';

subtest no_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->fights_statistics;

    is $result,
        { error => 'id parameter is required' },
        'Returns error if no ID provided.';
};

subtest valid_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->fights_statistics( id => 385 );

    is $result,
        {
        'longest_winning_fights'  => 5,
        'total_duration_sec'      => '50509',
        'shortest_fight_win_date' => '2013-02-09',
        'longest_fight_win_date'  => '2014-08-25',
        'num_win_by_ippon'        => '77',
        'longest_fight_win_comp'  => 'World Championships Chelyabinsk 2014',
        'num_contests_by_ippon'   => '77',
        'avg_duration'            => '00:06:44.0720',
        'shortest_fight_win_comp' => 'Grand Slam Paris 2013',
        'shortest_fight_win_with' => 'SHICHINOHE Ryu',
        'shortest_fight_win_sec'  => undef,
        'longest_fight_win'       => '01:40:00',
        'num_lost_by_ippon_proc'  => '0',
        'num_lost_by_ippon'       => '0',
        'unbeaten_statistics'     => {
            'beaten_by'           => '  ',
            'competition_name'    => undef,
            'competition_date'    => undef,
            'days'                => undef,
            'since'               => undef,
            'id_person_beaten_by' => undef
        },
        'shortest_fight_win'     => '00:00:13',
        'longest_fight_win_with' => 'SAIDOV Renat',
        'total_duration'         => '14:01:49',
        'avg_duration_sec'       => '404.0720',
        'num_lost'               => '0',
        'num_contests'           => '108',
        'longest_fight_win_sec'  => undef,
        'num_win_by_ippon_proc'  => '100.00',
        'current_winning_period' => 4,
        'num_win'                => '108'
        },
        'Returns data structure for valid competitor';
};

subtest invalid_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->fights_statistics( id => 0 );

    is $result,
        { error => 'statistics.error.id_person_not_given', },
        'Returns error for invalid or not found competitor';
};

done_testing;
