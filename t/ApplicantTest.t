# NOTE: This class is auto generated by the Swagger Codegen
# Please update the test case below to test the model.

use Test::More tests => 2;
use Test::Exception;

use lib 'lib';
use strict;
use warnings;


use_ok('VericredClient::Object::Applicant');

my $instance = VericredClient::Object::Applicant->new();

isa_ok($instance, 'VericredClient::Object::Applicant');

