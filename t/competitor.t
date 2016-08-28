use Test2::Bundle::Extended -target => 'Webservice::Judobase';

subtest competitor_no_id => sub {
    my $api = $CLASS->new();

    my $competitor = $api->competitor;

    is $competitor,
       {error => 'id parameter is required'},
       'Returns error if no ID provided.';
};

subtest competitor_valid => sub {
    my $api = $CLASS->new();

    my $competitor = $api->competitor(id => 1);

    is $competitor,
       {
           id => 1,
           error => '',
       },
       'Returns data structure for valid competitor';
};

subtest competitor_not_valid => sub {
    my $api = $CLASS->new();

    my $competitor = $api->competitor(id => 0);

    is $competitor,
    {error => 'Athlete not found'},
    'Returns error for invalid or not found competitor';
};

# Stubs here as paceholders for the methods from PHP app.
use Test2::Todo;

my $todo = Test2::Todo->new(reason => 'Not yet implemented');
    subtest find_id => sub {};
    subtest get_list => sub {};
    subtest info => sub {};
    subtest get_files => sub {};
    subtest birthday_competitors => sub {};
    subtest place_by_rank => sub {};
    subtest medals => sub {};
    subtest best_results_2 => sub {};
    subtest best_results => sub {};
    subtest best_results_wrl => sub {};
    subtest last_category => sub {};
    subtest round_info => sub {};
    subtest wins_losses => sub {};
    subtest results => sub {};
    subtest results2 => sub {};
    subtest wrl_current => sub {};
    subtest wrl => sub {};
    subtest ogq_competitions => sub {};
    subtest ogq => sub {};
    subtest get_ogq_qual => sub {};
    subtest total_awards => sub {};
    subtest awards => sub {};
    subtest player_vs_player => sub {};
    subtest contests => sub {};
    subtest contests_statistics => sub {};
    subtest get_images => sub {};
    subtest get_biography => sub {};
    subtest get_links_by_category => sub {};
    subtest throw_statistics => sub {};
    subtest wrl_history => sub {};
    subtest wrl_competitions => sub {};
$todo->end;

done_testing;
