use Test2::Bundle::Extended -target => 'Webservice::Judobase';

subtest no_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->birthdays_competitors;

    is $result,
       {error => 'min_age parameter is required'},
       'Returns error if no ID provided.';
};

subtest valid_params => sub {
    my $api = $CLASS->new();

    my $result = $api->competitor->birthdays_competitors(min_age => 50);

    is $result,
       {
          'feed' => [
                    {
                      'id_country' => '33',
                      'ppic' => 'https://www.judobase.org/files/persons//2015/04//56670_56669_Tom-Pahlman.jpg',
                      'age' => '68',
                      'country' => 'Finland',
                      'picture_filename' => '56670_56669_Tom-Pahlman.jpg',
                      'given_name' => 'Tom',
                      'pic_name' => '56670_56669_Tom-Pahlman.jpg',
                      'pic_folder' => '/2015/04/',
                      'country_short' => 'FIN',
                      'id_person' => '23335',
                      'family_name' => 'PAHLMAN',
                      'birth_date' => '1948/08/28'
                    },
                    {
                      'country' => 'Belgium',
                      'ppic' => 'https://www.judobase.org/files/persons//2015/04//57234_57233_Van-Geetsom-Christian.jpg',
                      'age' => '64',
                      'id_country' => '3',
                      'pic_folder' => '/2015/04/',
                      'pic_name' => '57234_57233_Van-Geetsom-Christian.jpg',
                      'given_name' => 'Christian',
                      'picture_filename' => '57234_57233_Van-Geetsom-Christian.jpg',
                      'family_name' => 'VAN GEETSOM',
                      'id_person' => '23511',
                      'country_short' => 'BEL',
                      'birth_date' => '1952/08/28'
                    }
                  ]
        },
       'Returns data structure for valid competitor';
};

done_testing;
