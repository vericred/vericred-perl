# NAME

VericredClient::Role - a Moose role for the Vericred API

Vericred's API allows you to search for Health Plans that a specific doctor
accepts.

## Getting Started

Visit our [Developer Portal](https://vericred.3scale.net) to
create an account.

Once you have created an account, you can create one Application for
Production and another for our Sandbox (select the appropriate Plan when
you create the Application).

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

Most endpoints are not paginated.  It will be noted in the documentation if/when
an endpoint is paginated.

When pagination is present, a `meta` stanza will be present in the response
with the total number of records

```
{
  things: [{ id: 1 }, { id: 2 }],
  meta: { total: 500 }
}
```

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



# VERSION

Automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 1.0.0
- Package version: 0.0.3
- Build date: 2016-06-01T14:02:28.267-04:00
- Build package: class io.swagger.codegen.languages.PerlClientCodegen

## A note on Moose

This role is the only component of the library that uses Moose. See 
VericredClient::ApiFactory for non-Moosey usage. 

# SYNOPSIS

The Perl Swagger Codegen project builds a library of Perl modules to interact with 
a web service defined by a OpenAPI Specification. See below for how to build the 
library.

This module provides an interface to the generated library. All the classes, 
objects, and methods (well, not quite \*all\*, see below) are flattened into this 
role. 

        package MyApp;
        use Moose;
        with 'VericredClient::Role';
        
        package main;
        
        my $api = MyApp->new({ tokens => $tokens });
        
        my $pet = $api->get_pet_by_id(pet_id => $pet_id);
        

## Structure of the library

The library consists of a set of API classes, one for each endpoint. These APIs
implement the method calls available on each endpoint. 

Additionally, there is a set of "object" classes, which represent the objects 
returned by and sent to the methods on the endpoints. 

An API factory class is provided, which builds instances of each endpoint API. 

This Moose role flattens all the methods from the endpoint APIs onto the consuming 
class. It also provides methods to retrieve the endpoint API objects, and the API 
factory object, should you need it. 

For documentation of all these methods, see AUTOMATIC DOCUMENTATION below.

## Configuring authentication

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

Note these are all optional, as are `prefix` and `in`, and depend on the API
you are accessing. Usually `prefix` and `in` will be determined by the code generator from
the spec and you will not need to set them at run time. If not, `in` will
default to 'head' and `prefix` to the empty string. 

The tokens will be placed in the `VericredClient::Configuration` namespace
as follows, but you don't need to know about this. 

- `$VericredClient::Configuration::username`

    String. The username for basic auth.

- `$VericredClient::Configuration::password`

    String. The password for basic auth.

- `$VericredClient::Configuration::api_key`

    Hashref. Keyed on the name of each key (there can be multiple tokens).

            $VericredClient::Configuration::api_key = {
                    secretKey => 'aaaabbbbccccdddd',
                    anotherKey => '1111222233334444',
                    };

- `$VericredClient::Configuration::api_key_prefix`

    Hashref. Keyed on the name of each key (there can be multiple tokens). Note not
    all api keys require a prefix.

            $VericredClient::Configuration::api_key_prefix = {
                    secretKey => 'string',
                    anotherKey => 'same or some other string',
                    };

- `$VericredClient::Configuration::access_token`

    String. The OAuth access token. 

# METHODS

## `base_url`

The generated code has the `base_url` already set as a default value. This method 
returns (and optionally sets, but only if the API client has not been 
created yet) the current value of `base_url`.

## `api_factory`

Returns an API factory object. You probably won't need to call this directly. 

        $self->api_factory('Pet'); # returns a VericredClient::PetApi instance
        
        $self->pet_api;            # the same

# MISSING METHODS

Most of the methods on the API are delegated to individual endpoint API objects
(e.g. Pet API, Store API, User API etc). Where different endpoint APIs use the
same method name (e.g. `new()`), these methods can't be delegated. So you need
to call `$api->pet_api->new()`.

In principle, every API is susceptible to the presence of a few, random, undelegatable 
method names. In practice, because of the way method names are constructed, it's 
unlikely in general that any methods will be undelegatable, except for: 

        new()
        class_documentation()
        method_documentation()

To call these methods, you need to get a handle on the relevant object, either
by calling `$api->foo_api` or by retrieving an object, e.g.
`$api->get_pet_by_id(pet_id => $pet_id)`. They are class methods, so
you could also call them on class names.

# BUILDING YOUR LIBRARY

See the homepage `https://github.com/swagger-api/swagger-codegen` for full details. 
But briefly, clone the git repository, build the codegen codebase, set up your build 
config file, then run the API build script. You will need git, Java 7 or 8 and Apache
maven 3.0.3 or better already installed.

The config file should specify the project name for the generated library: 

        {"moduleName":"WWW::MyProjectName"}

Your library files will be built under `WWW::MyProjectName`.

          $ git clone https://github.com/swagger-api/swagger-codegen.git
          $ cd swagger-codegen
          $ mvn package
          $ java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
    -i [URL or file path to JSON swagger API spec] \
    -l perl \
    -c /path/to/config/file.json \
    -o /path/to/output/folder

Bang, all done. Run the `autodoc` script in the `bin` directory to see the API 
you just built. 

# AUTOMATIC DOCUMENTATION

You can print out a summary of the generated API by running the included
`autodoc` script in the `bin` directory of your generated library. A few
output formats are supported:

          Usage: autodoc [OPTION]

    -w           wide format (default)
    -n           narrow format
    -p           POD format 
    -H           HTML format 
    -m           Markdown format
    -h           print this help message
    -c           your application class
    

The `-c` option allows you to load and inspect your own application. A dummy
namespace is used if you don't supply your own class.

# DOCUMENTATION FROM THE OpenAPI Spec

Additional documentation for each class and method may be provided by the Swagger 
spec. If so, this is available via the `class_documentation()` and 
`method_documentation()` methods on each generated object class, and the 
`method_documentation()` method on the endpoint API classes: 

        my $cmdoc = $api->pet_api->method_documentation->{$method_name}; 
        
        my $odoc = $api->get_pet_by_id->(pet_id => $pet_id)->class_documentation;                                  
        my $omdoc = $api->get_pet_by_id->(pet_id => $pet_id)->method_documentation->{method_name}; 
        

Each of these calls returns a hashref with various useful pieces of information.

# LOAD THE MODULES

To load the API packages:
```perl
use VericredClient::DrugsApi;
use VericredClient::NetworksApi;
use VericredClient::PlansApi;
use VericredClient::ProvidersApi;
use VericredClient::ZipCountiesApi;

```

To load the models:
```perl
use VericredClient::Object::Applicant;
use VericredClient::Object::Base;
use VericredClient::Object::Carrier;
use VericredClient::Object::CarrierSubsidiary;
use VericredClient::Object::County;
use VericredClient::Object::CountyBulk;
use VericredClient::Object::Drug;
use VericredClient::Object::DrugCoverage;
use VericredClient::Object::DrugCoverageResponse;
use VericredClient::Object::DrugPackage;
use VericredClient::Object::DrugSearchResponse;
use VericredClient::Object::Meta;
use VericredClient::Object::Network;
use VericredClient::Object::NetworkSearchResponse;
use VericredClient::Object::Plan;
use VericredClient::Object::PlanCounty;
use VericredClient::Object::PlanCountyBulk;
use VericredClient::Object::PlanSearchResponse;
use VericredClient::Object::PlanSearchResult;
use VericredClient::Object::Pricing;
use VericredClient::Object::Provider;
use VericredClient::Object::ProviderShowResponse;
use VericredClient::Object::ProvidersSearchResponse;
use VericredClient::Object::RatingArea;
use VericredClient::Object::RequestPlanFind;
use VericredClient::Object::RequestPlanFindApplicant;
use VericredClient::Object::RequestPlanFindProvider;
use VericredClient::Object::RequestProvidersSearch;
use VericredClient::Object::State;
use VericredClient::Object::ZipCode;
use VericredClient::Object::ZipCountiesResponse;
use VericredClient::Object::ZipCounty;
use VericredClient::Object::ZipCountyBulk;
use VericredClient::Object::ZipCountyResponse;

````

# GETTING STARTED
Put the Perl SDK under the 'lib' folder in your project directory, then run the following
```perl
#!/usr/bin/perl
use lib 'lib';
use strict;
use warnings;
# load the API package
use VericredClient::DrugsApi;
use VericredClient::NetworksApi;
use VericredClient::PlansApi;
use VericredClient::ProvidersApi;
use VericredClient::ZipCountiesApi;

# load the models
use VericredClient::Object::Applicant;
use VericredClient::Object::Base;
use VericredClient::Object::Carrier;
use VericredClient::Object::CarrierSubsidiary;
use VericredClient::Object::County;
use VericredClient::Object::CountyBulk;
use VericredClient::Object::Drug;
use VericredClient::Object::DrugCoverage;
use VericredClient::Object::DrugCoverageResponse;
use VericredClient::Object::DrugPackage;
use VericredClient::Object::DrugSearchResponse;
use VericredClient::Object::Meta;
use VericredClient::Object::Network;
use VericredClient::Object::NetworkSearchResponse;
use VericredClient::Object::Plan;
use VericredClient::Object::PlanCounty;
use VericredClient::Object::PlanCountyBulk;
use VericredClient::Object::PlanSearchResponse;
use VericredClient::Object::PlanSearchResult;
use VericredClient::Object::Pricing;
use VericredClient::Object::Provider;
use VericredClient::Object::ProviderShowResponse;
use VericredClient::Object::ProvidersSearchResponse;
use VericredClient::Object::RatingArea;
use VericredClient::Object::RequestPlanFind;
use VericredClient::Object::RequestPlanFindApplicant;
use VericredClient::Object::RequestPlanFindProvider;
use VericredClient::Object::RequestProvidersSearch;
use VericredClient::Object::State;
use VericredClient::Object::ZipCode;
use VericredClient::Object::ZipCountiesResponse;
use VericredClient::Object::ZipCounty;
use VericredClient::Object::ZipCountyBulk;
use VericredClient::Object::ZipCountyResponse;

# for displaying the API response data
use Data::Dumper;

my $api_instance = VericredClient::DrugsApi->new();
my $ndc_package_code = '12345-4321-11'; # string | NDC package code
my $audience = 'individual'; # string | Two-character state code
my $state_code = 'NY'; # string | Two-character state code
my $vericred_api_key = 'api-doc-key'; # string | API Key

eval {
    my $result = $api_instance->get_drug_coverages(ndc_package_code => $ndc_package_code, audience => $audience, state_code => $state_code, vericred_api_key => $vericred_api_key);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DrugsApi->get_drug_coverages: $@\n";
}

```

# DOCUMENTATION FOR API ENDPOINTS

All URIs are relative to *https://api.vericred.com/*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*DrugsApi* | [**get_drug_coverages**](docs/DrugsApi.md#get_drug_coverages) | **GET** /drug_packages/{ndc_package_code}/coverages | Search for DrugCoverages
*DrugsApi* | [**list_drugs**](docs/DrugsApi.md#list_drugs) | **GET** /drugs | Drug Search
*NetworksApi* | [**list_networks**](docs/NetworksApi.md#list_networks) | **GET** /networks | Networks
*PlansApi* | [**find_plans**](docs/PlansApi.md#find_plans) | **POST** /plans/search | Find Plans
*ProvidersApi* | [**get_provider**](docs/ProvidersApi.md#get_provider) | **GET** /providers/{npi} | Find a Provider
*ProvidersApi* | [**get_providers**](docs/ProvidersApi.md#get_providers) | **POST** /providers/search | Find Providers
*ZipCountiesApi* | [**get_zip_counties**](docs/ZipCountiesApi.md#get_zip_counties) | **GET** /zip_counties | Search for Zip Counties


# DOCUMENTATION FOR MODELS
 - [VericredClient::Object::Applicant](docs/Applicant.md)
 - [VericredClient::Object::Base](docs/Base.md)
 - [VericredClient::Object::Carrier](docs/Carrier.md)
 - [VericredClient::Object::CarrierSubsidiary](docs/CarrierSubsidiary.md)
 - [VericredClient::Object::County](docs/County.md)
 - [VericredClient::Object::CountyBulk](docs/CountyBulk.md)
 - [VericredClient::Object::Drug](docs/Drug.md)
 - [VericredClient::Object::DrugCoverage](docs/DrugCoverage.md)
 - [VericredClient::Object::DrugCoverageResponse](docs/DrugCoverageResponse.md)
 - [VericredClient::Object::DrugPackage](docs/DrugPackage.md)
 - [VericredClient::Object::DrugSearchResponse](docs/DrugSearchResponse.md)
 - [VericredClient::Object::Meta](docs/Meta.md)
 - [VericredClient::Object::Network](docs/Network.md)
 - [VericredClient::Object::NetworkSearchResponse](docs/NetworkSearchResponse.md)
 - [VericredClient::Object::Plan](docs/Plan.md)
 - [VericredClient::Object::PlanCounty](docs/PlanCounty.md)
 - [VericredClient::Object::PlanCountyBulk](docs/PlanCountyBulk.md)
 - [VericredClient::Object::PlanSearchResponse](docs/PlanSearchResponse.md)
 - [VericredClient::Object::PlanSearchResult](docs/PlanSearchResult.md)
 - [VericredClient::Object::Pricing](docs/Pricing.md)
 - [VericredClient::Object::Provider](docs/Provider.md)
 - [VericredClient::Object::ProviderShowResponse](docs/ProviderShowResponse.md)
 - [VericredClient::Object::ProvidersSearchResponse](docs/ProvidersSearchResponse.md)
 - [VericredClient::Object::RatingArea](docs/RatingArea.md)
 - [VericredClient::Object::RequestPlanFind](docs/RequestPlanFind.md)
 - [VericredClient::Object::RequestPlanFindApplicant](docs/RequestPlanFindApplicant.md)
 - [VericredClient::Object::RequestPlanFindProvider](docs/RequestPlanFindProvider.md)
 - [VericredClient::Object::RequestProvidersSearch](docs/RequestProvidersSearch.md)
 - [VericredClient::Object::State](docs/State.md)
 - [VericredClient::Object::ZipCode](docs/ZipCode.md)
 - [VericredClient::Object::ZipCountiesResponse](docs/ZipCountiesResponse.md)
 - [VericredClient::Object::ZipCounty](docs/ZipCounty.md)
 - [VericredClient::Object::ZipCountyBulk](docs/ZipCountyBulk.md)
 - [VericredClient::Object::ZipCountyResponse](docs/ZipCountyResponse.md)


# DOCUMENTATION FOR AUTHORIATION
 All endpoints do not require authorization.



