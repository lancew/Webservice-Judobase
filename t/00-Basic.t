use Test2::Bundle::Extended -target => 'Webservice::Judobase';

subtest url => sub {
    my $api = $CLASS->new();

    my $url = $api->url;

    is $url, 'http://data.judobase.org/api/',
        'Returns the correct default url';
};

subtest status => sub {
    my $api = $CLASS->new();

    my $status = $api->status;

    is $status, 0, 'Returns the correct default url';
};

done_testing;

=pod
# Stubs here as paceholders for the methods from PHP app.
use Test2::Todo;

my $todo = Test2::Todo->new(reason => 'Not yet implemented');
    subtest best_results_2 => sub {};
    subtest best_results_wrl => sub {};
 
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