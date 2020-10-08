use Test2::V0 -target => 'Webservice::Judobase';
use Data::Dumper;

subtest competitions => sub {
    my $api = $CLASS->new();

    my $result = $api->general->competitions(  );


warn Dumper $result->[0];
    is $result->[0],
      {
          'updated_at' => '2020-04-03 12:42:00',
          'ages' => [
                      'sen'
                    ],
          'name' => 'Olympic Games Tokyo 2020',
          'country' => 'Japan',
          'date_to' => '2021/07/31',
          'has_results' => '0',
          'country_short' => 'JPN',
          'continent_short' => 'JUA',
          'comp_year' => '2021',
          'prime_event' => '1',
          'rank_name' => 'Olympic Games',
          'city' => 'Tokyo',
          'id_competition' => '2035',
          'updated_at_ts' => '1585917720',
          'date_from' => '2021/07/24',
          'has_logo' => '0',
          'competition_code' => 'oly_2020',
          'timezone' => undef,
          'id_country' => '13'
      },
      'Returns correct data.';
};
done_testing;