use Test2::Bundle::Extended -target => 'Webservice::Judobase';

subtest no_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->best_results;

    is $result,
       {error => 'id parameter is required'},
       'Returns error if no ID provided.';
};

subtest valid_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->best_results(id => 385);

    is $result,
       [
          {
            'year' => '2013',
            'name_short' => 'GS Paris 2013',
            'sort_by' => '10-1',
            'points' => '500',
            'competition' => 'Grand Slam Paris 2013',
            'rank_short' => undef,
            'place' => '1'
          },
          {
            'name_short' => undef,
            'year' => '2012',
            'points' => '600',
            'sort_by' => '10-1',
            'competition' => 'Olympic Games London 2012',
            'place' => '1',
            'rank_short' => undef
          },
          {
            'sort_by' => '10-1',
            'points' => '100',
            'year' => '2012',
            'name_short' => 'WCUP men Lisbon',
            'place' => '1',
            'rank_short' => undef,
            'competition' => 'World Cup Lisbon 2012'
          },
          {
            'competition' => 'Grand Slam Paris 2012',
            'rank_short' => undef,
            'place' => '1',
            'name_short' => 'GS Paris',
            'year' => '2012',
            'points' => '300',
            'sort_by' => '10-1'
          },
          {
            'competition' => 'World Championships Paris 2011',
            'rank_short' => undef,
            'place' => '1',
            'year' => '2011',
            'name_short' => 'WC Paris',
            'sort_by' => '10-1',
            'points' => '500'
          }
        ],
       'Returns data structure for valid competitor';
};

subtest invalid_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->best_results(id => 0);

    is $result,
    { 
           error => 'info.error.id_person_not_given', 
    },
    'Returns error for invalid or not found competitor';
};

done_testing;
