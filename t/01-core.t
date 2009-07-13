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

    my $validators = [
      int_param => [
          ['TRIM']
      ],
      collapse  => [
          ['TRIM_COLLAPSE']
      ],
      left      => [
          ['TRIM_LEAD']
      ],
      right     => [
          ['TRIM_TRAIL']
      ]
    ];

    use Validator::Custom::Trim;
    my $results = Validator::Custom::Trim->new->validate($data,$validators)->results;

    is_deeply(
        $results, 
        { int_param => '123', left => "abc  ", right => '  def', collapse => "a b c"},
        'trim check'
    );
}


