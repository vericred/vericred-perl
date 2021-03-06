=begin comment

Vericred API

Vericred's API allows you to search for Health Plans that a specific doctor
accepts.

## Getting Started

Visit our [Developer Portal](https://developers.vericred.com) to
create an account.

Once you have created an account, you can create one Application for
Production and another for our Sandbox (select the appropriate Plan when
you create the Application).

## SDKs

Our API follows standard REST conventions, so you can use any HTTP client
to integrate with us. You will likely find it easier to use one of our
[autogenerated SDKs](https://github.com/vericred/?query=vericred-),
which we make available for several common programming languages.

## Authentication

To authenticate, pass the API Key you created in the Developer Portal as
a `Vericred-Api-Key` header.

`curl -H 'Vericred-Api-Key: YOUR_KEY' "https://api.vericred.com/providers?search_term=Foo&zip_code=11215"`

## Versioning

Vericred's API default to the latest version.  However, if you need a specific
version, you can request it with an `Accept-Version` header.

The current version is `v3`.  Previous versions are `v1` and `v2`.

`curl -H 'Vericred-Api-Key: YOUR_KEY' -H 'Accept-Version: v2' "https://api.vericred.com/providers?search_term=Foo&zip_code=11215"`

## Pagination

Endpoints that accept `page` and `per_page` parameters are paginated. They expose
four additional fields that contain data about your position in the response,
namely `Total`, `Per-Page`, `Link`, and `Page` as described in [RFC-5988](https://tools.ietf.org/html/rfc5988).

For example, to display 5 results per page and view the second page of a
`GET` to `/networks`, your final request would be `GET /networks?....page=2&per_page=5`.

## Sideloading

When we return multiple levels of an object graph (e.g. `Provider`s and their `State`s
we sideload the associated data.  In this example, we would provide an Array of
`State`s and a `state_id` for each provider.  This is done primarily to reduce the
payload size since many of the `Provider`s will share a `State`

```
{
  providers: [{ id: 1, state_id: 1}, { id: 2, state_id: 1 }],
  states: [{ id: 1, code: 'NY' }]
}
```

If you need the second level of the object graph, you can just match the
corresponding id.

## Selecting specific data

All endpoints allow you to specify which fields you would like to return.
This allows you to limit the response to contain only the data you need.

For example, let's take a request that returns the following JSON by default

```
{
  provider: {
    id: 1,
    name: 'John',
    phone: '1234567890',
    field_we_dont_care_about: 'value_we_dont_care_about'
  },
  states: [{
    id: 1,
    name: 'New York',
    code: 'NY',
    field_we_dont_care_about: 'value_we_dont_care_about'
  }]
}
```

To limit our results to only return the fields we care about, we specify the
`select` query string parameter for the corresponding fields in the JSON
document.

In this case, we want to select `name` and `phone` from the `provider` key,
so we would add the parameters `select=provider.name,provider.phone`.
We also want the `name` and `code` from the `states` key, so we would
add the parameters `select=states.name,staes.code`.  The id field of
each document is always returned whether or not it is requested.

Our final request would be `GET /providers/12345?select=provider.name,provider.phone,states.name,states.code`

The response would be

```
{
  provider: {
    id: 1,
    name: 'John',
    phone: '1234567890'
  },
  states: [{
    id: 1,
    name: 'New York',
    code: 'NY'
  }]
}
```

## Benefits summary format
Benefit cost-share strings are formatted to capture:
 * Network tiers
 * Compound or conditional cost-share
 * Limits on the cost-share
 * Benefit-specific maximum out-of-pocket costs

**Example #1**
As an example, we would represent [this Summary of Benefits &amp; Coverage](https://s3.amazonaws.com/vericred-data/SBC/2017/33602TX0780032.pdf) as:

* **Hospital stay facility fees**:
  - Network Provider: `$400 copay/admit plus 20% coinsurance`
  - Out-of-Network Provider: `$1,500 copay/admit plus 50% coinsurance`
  - Vericred's format for this benefit: `In-Network: $400 before deductible then 20% after deductible / Out-of-Network: $1,500 before deductible then 50% after deductible`

* **Rehabilitation services:**
  - Network Provider: `20% coinsurance`
  - Out-of-Network Provider: `50% coinsurance`
  - Limitations & Exceptions: `35 visit maximum per benefit period combined with Chiropractic care.`
  - Vericred's format for this benefit: `In-Network: 20% after deductible / Out-of-Network: 50% after deductible | limit: 35 visit(s) per Benefit Period`

**Example #2**
In [this other Summary of Benefits &amp; Coverage](https://s3.amazonaws.com/vericred-data/SBC/2017/40733CA0110568.pdf), the **specialty_drugs** cost-share has a maximum out-of-pocket for in-network pharmacies.
* **Specialty drugs:**
  - Network Provider: `40% coinsurance up to a $500 maximum for up to a 30 day supply`
  - Out-of-Network Provider `Not covered`
  - Vericred's format for this benefit: `In-Network: 40% after deductible, up to $500 per script / Out-of-Network: 100%`

**BNF**

Here's a description of the benefits summary string, represented as a context-free grammar:

```
<cost-share>     ::= <tier> <opt-num-prefix> <value> <opt-per-unit> <deductible> <tier-limit> "/" <tier> <opt-num-prefix> <value> <opt-per-unit> <deductible> "|" <benefit-limit>
<tier>           ::= "In-Network:" | "In-Network-Tier-2:" | "Out-of-Network:"
<opt-num-prefix> ::= "first" <num> <unit> | ""
<unit>           ::= "day(s)" | "visit(s)" | "exam(s)" | "item(s)"
<value>          ::= <ddct_moop> | <copay> | <coinsurance> | <compound> | "unknown" | "Not Applicable"
<compound>       ::= <copay> <deductible> "then" <coinsurance> <deductible> | <copay> <deductible> "then" <copay> <deductible> | <coinsurance> <deductible> "then" <coinsurance> <deductible>
<copay>          ::= "$" <num>
<coinsurace>     ::= <num> "%"
<ddct_moop>      ::= <copay> | "Included in Medical" | "Unlimited"
<opt-per-unit>   ::= "per day" | "per visit" | "per stay" | ""
<deductible>     ::= "before deductible" | "after deductible" | ""
<tier-limit>     ::= ", " <limit> | ""
<benefit-limit>  ::= <limit> | ""
```



OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end comment

=cut

#
# NOTE: This class is auto generated by the swagger code generator program. 
# Do not edit the class manually.
# Ref: https://github.com/swagger-api/swagger-codegen
#
package VericredClient::Role;
use utf8;

use Moose::Role;
use namespace::autoclean;
use Class::Inspector;
use Log::Any qw($log);
use VericredClient::ApiFactory;

has base_url => ( is => 'ro',
                  required => 0,
                  isa => 'Str',
                  documentation => 'Root of the server that requests are sent to',
                  );

has api_factory => ( is => 'ro',
                     isa => 'VericredClient::ApiFactory',
                     builder => '_build_af', 
                     lazy => 1,
                     documentation => 'Builds an instance of the endpoint API class',
                     );

has tokens => ( is => 'ro',
                isa => 'HashRef',
                required => 0,
                default => sub { {} },
                documentation => 'The auth tokens required by the application - basic, OAuth and/or API key(s)',
                );

has _cfg => ( is => 'ro',
              isa => 'Str',
              default => 'VericredClient::Configuration',
              );

has version_info => ( is => 'ro', 
                      isa => 'HashRef', 
                      default => sub { {
                          app_name => 'Vericred API',
                          app_version => '1.0.0',
                          generated_date => '2017-01-26T16:04:02.241-05:00',
                          generator_class => 'class io.swagger.codegen.languages.PerlClientCodegen',
                      } },
                      documentation => 'Information about the application version and the codegen codebase version'
                      );

sub BUILD {
	my $self = shift;
	
	$self->_cfg->accept_tokens( $self->tokens ) if keys %{$self->tokens};
	
	# ignore these symbols imported into API namespaces
	my %outsiders = map {$_ => 1} qw( croak );
	
	my %delegates;
	
	# collect the methods callable on each API
	foreach my $api_name ($self->api_factory->apis_available) {
		my $api_class = $self->api_factory->classname_for($api_name);
		my $methods = Class::Inspector->methods($api_class, 'expanded'); # not Moose, so use CI instead
		my @local_methods = grep {! /^_/} grep {! $outsiders{$_}} map {$_->[2]} grep {$_->[1] eq $api_class} @$methods;
		push( @{$delegates{$_}}, {api_name => $api_name, api_class => $api_class} ) for @local_methods;			
	}
	
	# remove clashes
	foreach my $method (keys %delegates) {
		if ( @{$delegates{$method}} > 1 ) {
			my ($apis) = delete $delegates{$method};
		}
	}
	
    # build the flattened API
    foreach my $api_name ($self->api_factory->apis_available) {
        my $att_name = sprintf "%s_api", lc($api_name);
        my $api_class = $self->api_factory->classname_for($api_name);
        my @delegated = grep { $delegates{$_}->[0]->{api_name} eq $api_name } keys %delegates;
        $log->debugf("Adding API: '%s' handles %s", $att_name, join ', ', @delegated);
        $self->meta->add_attribute( $att_name => ( 
                                    is => 'ro',
                                    isa => $api_class,
                                    default => sub {$self->api_factory->get_api($api_name)},
                                    lazy => 1,
                                    handles => \@delegated,
                                    ) );
    }
}

sub _build_af {
	my $self = shift;
	my %args;
	$args{base_url} = $self->base_url if $self->base_url;
	return VericredClient::ApiFactory->new(%args);
}

=head1 NAME

VericredClient::Role - a Moose role for the Vericred API 

=head2 Vericred API version: 1.0.0

=head1 VERSION

Automatically generated by the Perl Swagger Codegen project: 

=over 4 

=item Build date: 2017-01-26T16:04:02.241-05:00

=item Build package: class io.swagger.codegen.languages.PerlClientCodegen

=item Codegen version: 

=back

=head2 A note on Moose

This role is the only component of the library that uses Moose. See 
VericredClient::ApiFactory for non-Moosey usage. 

=head1 SYNOPSIS

The Perl Swagger Codegen project builds a library of Perl modules to interact with 
a web service defined by a OpenAPI Specification. See below for how to build the 
library.

This module provides an interface to the generated library. All the classes, 
objects, and methods (well, not quite *all*, see below) are flattened into this 
role. 

	package MyApp;
	use Moose;
	with 'VericredClient::Role';
	
	package main;
	
	my $api = MyApp->new({ tokens => $tokens });
	
	my $pet = $api->get_pet_by_id(pet_id => $pet_id);
	
=head2 Structure of the library

The library consists of a set of API classes, one for each endpoint. These APIs
implement the method calls available on each endpoint. 

Additionally, there is a set of "object" classes, which represent the objects 
returned by and sent to the methods on the endpoints. 

An API factory class is provided, which builds instances of each endpoint API. 

This Moose role flattens all the methods from the endpoint APIs onto the consuming 
class. It also provides methods to retrieve the endpoint API objects, and the API 
factory object, should you need it. 

For documentation of all these methods, see AUTOMATIC DOCUMENTATION below.

=head2 Configuring authentication

In the normal case, the OpenAPI Spec will describe what parameters are
required and where to put them. You just need to supply the tokens.

    my $tokens = {
        # basic
        username => $username,
        password => $password,
        
        # oauth
        access_token => $oauth_token,
        
        # keys
        $some_key => { token => $token,
                       prefix => $prefix, 
                       in => $in,             # 'head||query',     
                       },
                       
        $another => { token => $token,
                      prefix => $prefix, 
                      in => $in,              # 'head||query',      
                      },                   
        ...,
        
        };
        
        my $api = MyApp->new({ tokens => $tokens });

Note these are all optional, as are C<prefix> and C<in>, and depend on the API
you are accessing. Usually C<prefix> and C<in> will be determined by the code generator from
the spec and you will not need to set them at run time. If not, C<in> will
default to 'head' and C<prefix> to the empty string. 

The tokens will be placed in the C<VericredClient::Configuration> namespace
as follows, but you don't need to know about this. 

=over 4

=item C<$VericredClient::Configuration::username>

String. The username for basic auth.

=item C<$VericredClient::Configuration::password>

String. The password for basic auth.

=item C<$VericredClient::Configuration::api_key>

Hashref. Keyed on the name of each key (there can be multiple tokens).

	$VericredClient::Configuration::api_key = {
		secretKey => 'aaaabbbbccccdddd',
		anotherKey => '1111222233334444',
		};

=item C<$VericredClient::Configuration::api_key_prefix>

Hashref. Keyed on the name of each key (there can be multiple tokens). Note not
all api keys require a prefix.

	$VericredClient::Configuration::api_key_prefix = {
		secretKey => 'string',
		anotherKey => 'same or some other string',
		};

=item C<$VericredClient::Configuration::access_token>

String. The OAuth access token. 

=back

=head1 METHODS

=head2 C<base_url>

The generated code has the C<base_url> already set as a default value. This method 
returns (and optionally sets, but only if the API client has not been 
created yet) the current value of C<base_url>.

=head2 C<api_factory>

Returns an API factory object. You probably won't need to call this directly. 
	
        $self->api_factory('Pet'); # returns a VericredClient::PetApi instance
        
        $self->pet_api;            # the same

=head1 MISSING METHODS

Most of the methods on the API are delegated to individual endpoint API objects
(e.g. Pet API, Store API, User API etc). Where different endpoint APIs use the
same method name (e.g. C<new()>), these methods can't be delegated. So you need
to call C<$api-E<gt>pet_api-E<gt>new()>.

In principle, every API is susceptible to the presence of a few, random, undelegatable 
method names. In practice, because of the way method names are constructed, it's 
unlikely in general that any methods will be undelegatable, except for: 

	new()
	class_documentation()
	method_documentation()

To call these methods, you need to get a handle on the relevant object, either
by calling C<$api-E<gt>foo_api> or by retrieving an object, e.g.
C<$api-E<gt>get_pet_by_id(pet_id =E<gt> $pet_id)>. They are class methods, so
you could also call them on class names.

=head1 BUILDING YOUR LIBRARY

See the homepage C<https://github.com/swagger-api/swagger-codegen> for full details. 
But briefly, clone the git repository, build the codegen codebase, set up your build 
config file, then run the API build script. You will need git, Java 7 or 8 and Apache
maven 3.0.3 or better already installed.

The config file should specify the project name for the generated library: 

	{"moduleName":"WWW::MyProjectName"}

Your library files will be built under C<WWW::MyProjectName>.

	$ git clone https://github.com/swagger-api/swagger-codegen.git
	$ cd swagger-codegen
	$ mvn package
	$ java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
  -i [URL or file path to JSON swagger API spec] \
  -l perl \
  -c /path/to/config/file.json \
  -o /path/to/output/folder

Bang, all done. Run the C<autodoc> script in the C<bin> directory to see the API 
you just built. 

=head1 AUTOMATIC DOCUMENTATION

You can print out a summary of the generated API by running the included
C<autodoc> script in the C<bin> directory of your generated library. A few
output formats are supported:

	Usage: autodoc [OPTION]

  -w           wide format (default)
  -n           narrow format
  -p           POD format 
  -H           HTML format 
  -m           Markdown format
  -h           print this help message
  -c           your application class
  
The C<-c> option allows you to load and inspect your own application. A dummy
namespace is used if you don't supply your own class.

=head1 DOCUMENTATION FROM THE OpenAPI Spec

Additional documentation for each class and method may be provided by the Swagger 
spec. If so, this is available via the C<class_documentation()> and 
C<method_documentation()> methods on each generated object class, and the 
C<method_documentation()> method on the endpoint API classes: 

	my $cmdoc = $api->pet_api->method_documentation->{$method_name}; 
	
	my $odoc = $api->get_pet_by_id->(pet_id => $pet_id)->class_documentation;				   
	my $omdoc = $api->get_pet_by_id->(pet_id => $pet_id)->method_documentation->{method_name}; 
	
Each of these calls returns a hashref with various useful pieces of information.	

=cut

1;
