use Test2::Bundle::Extended -target => 'Webservice::Judobase';

subtest info_no_params => sub {
    my $api = $CLASS->new();

    my $info = $api->competitor->info;

    is $info,
        { error => 'id parameter is required' },
        'Returns error if no ID provided.';
};

subtest info_valid_params => sub {
    my $api = $CLASS->new();

    my $info = $api->competitor->info( id => 1 );

    is $info,
        {
        'picture_filename' => '2_0921500000101.jpg',
        'family_name'      => 'BULC',
        'personal_picture' =>
            'https://www.judobase.org/files/persons//imported//2_0921500000101.jpg',
        'file_flag'         => 'Slovenia.gif',
        'age'               => '56',
        'club'              => undef,
        'family_name_local' => 'BULC',
        'name'              => '2_0921500000101.jpg',
        'middle_name_local' => undef,
        'middle_name'       => undef,
        'id_country'        => '1',
        'categories'        => [ '' ],
        'country_short'     => 'SLO',
        'side'              => undef,
        'coach'             => undef,
        'belt'              => undef,
        'ftechique'         => undef,
        'country'           => 'Slovenia',
        'birth_date'        => '1960-02-22',
        'best_result'       => undef,
        'gender'            => 'male',
        'folder'            => '/imported/',
        'youtube_links'     => undef,
        'given_name_local'  => "Ale\x{161}",
        'height'            => undef,
        'given_name'        => 'Ales',
        'short_name'        => 'BULC'
        },
        'Returns data structure for valid competitor';
};

subtest info_not_valid_params => sub {
    my $api = $CLASS->new();

    my $info = $api->competitor->info( id => 0 );

    is $info,
        { error => 'info.error.id_person_not_given', },
        'Returns error for invalid or not found competitor';
};

=pod
# Stubs here as paceholders for the methods from PHP app.
use Test2::Todo;

my $todo = Test2::Todo->new(reason => 'Not yet implemented');
    subtest best_results => sub {};
    subtest best_results_2 => sub {};
    subtest best_results_wrl => sub {};
    subtest birthday_competitors => sub {};
    subtest contests => sub {};
    subtest contests_statistics => sub {};
    subtest find_id => sub {};
    subtest get_biography => sub {};
    subtest get_files => sub {};
    subtest get_images => sub {};
    subtest get_links_by_category => sub {};
    subtest get_list => sub {};
    subtest get_ogq_qual => sub {};
    subtest info => sub {};
    subtest last_category => sub {};
    subtest medals => sub {};
    subtest ogq => sub {};
    subtest ogq_competitions => sub {};
    subtest place_by_rank => sub {};
    subtest player_vs_player => sub {};
    subtest results => sub {};
    subtest results2 => sub {};
    subtest round_info => sub {};
    subtest throw_statistics => sub {};
    subtest total_awards => sub {};
    subtest wins_losses => sub {};
    subtest wrl => sub {};
    subtest wrl_competitions => sub {};
    subtest wrl_current => sub {};
    subtest wrl_history => sub {};
$todo->end;
=cut

done_testing;
