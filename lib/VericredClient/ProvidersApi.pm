#
# Copyright 2016 SmartBear Software
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
#
package VericredClient::ProvidersApi;

require 5.6.0;
use strict;
use warnings;
use utf8; 
use Exporter;
use Carp qw( croak );
use Log::Any qw($log);

use VericredClient::ApiClient;
use VericredClient::Configuration;

use base "Class::Data::Inheritable";

__PACKAGE__->mk_classdata('method_documentation' => {});

sub new {
    my $class   = shift;
    my (%self) = (
        'api_client' => VericredClient::ApiClient->instance,
        @_
    );

    #my $self = {
    #    #api_client => $options->{api_client}
    #    api_client => $default_api_client
    #}; 

    bless \%self, $class;

}


#
# get_provider
#
# Find a Provider
# 
# @param string $npi NPI number (required)
# @param string $vericred_api_key API Key (optional)
{
    my $params = {
    'npi' => {
        data_type => 'string',
        description => 'NPI number',
        required => '1',
    },
    'vericred_api_key' => {
        data_type => 'string',
        description => 'API Key',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ get_provider } = { 
    	summary => 'Find a Provider',
        params => $params,
        returns => 'Provider',
        };
}
# @return Provider
#
sub get_provider {
    my ($self, %args) = @_;

    # verify the required parameter 'npi' is set
    unless (exists $args{'npi'}) {
      croak("Missing the required parameter 'npi' when calling get_provider");
    }

    # parse inputs
    my $_resource_path = '/providers/{npi}';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept();
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # header params
    if ( exists $args{'vericred_api_key'}) {
        $header_params->{'Vericred-Api-Key'} = $self->{api_client}->to_header_value($args{'vericred_api_key'});
    }

    # path params
    if ( exists $args{'npi'}) {
        my $_base_variable = "{" . "npi" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'npi'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Provider', $response);
    return $_response_object;
}

#
# get_providers
#
# Find Providers
# 
# @param RequestProvidersSearch $body  (optional)
{
    my $params = {
    'body' => {
        data_type => 'RequestProvidersSearch',
        description => '',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ get_providers } = { 
    	summary => 'Find Providers',
        params => $params,
        returns => 'ProvidersSearchResponse',
        };
}
# @return ProvidersSearchResponse
#
sub get_providers {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/providers/search';
    $_resource_path =~ s/{format}/json/; # default format to json

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept();
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    my $_body_data;
    # body params
    if ( exists $args{'body'}) {
        $_body_data = $args{'body'};
    }

    # authentication setting, if any
    my $auth_settings = [qw()];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ProvidersSearchResponse', $response);
    return $_response_object;
}

1;
