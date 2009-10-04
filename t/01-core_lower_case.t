use Test::More 'no_plan';
use strict;
use warnings;

{
    my $data = {
        int_param => ' 123 ',
        collapse  => "  \n a \r\n b\nc  \t",
        left      => '  abc  ',
        right     => '  def  '
    };

    my $validation_rule = [
      int_param => [
          ['trim']
      ],
      collapse  => [
          ['trim_collapse']
      ],
      left      => [
          ['trim_lead']
      ],
      right     => [
          ['trim_trail']
      ]
    ];

    use Validator::Custom::Trim;
    my $results = Validator::Custom::Trim->new->validate($data,$validation_rule)->results;

    is_deeply(
        $results, 
        { int_param => '123', left => "abc  ", right => '  def', collapse => "a b c"},
        'trim check'
    );
}


