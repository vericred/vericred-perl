# VericredClient::DrugsApi

## Load the API package
```perl
use VericredClient::Object::DrugsApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_drug_coverages**](DrugsApi.md#get_drug_coverages) | **GET** /drug_packages/{ndc_package_code}/coverages | Search for DrugCoverages
[**list_drugs**](DrugsApi.md#list_drugs) | **GET** /drugs | Drug Search


# **get_drug_coverages**
> DrugCoverageResponse get_drug_coverages(ndc_package_code => $ndc_package_code, audience => $audience, state_code => $state_code)

Search for DrugCoverages

Drug Coverages are the specific tier level, quantity limit, prior authorization and step therapy for a given Drug/Plan combination. This endpoint returns all DrugCoverages for a given Drug

### Example 
```perl
use Data::Dumper;

# Configure API key authorization: Vericred-Api-Key
$VericredClient::Configuration::api_key->{'Vericred-Api-Key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$VericredClient::Configuration::api_key_prefix->{'Vericred-Api-Key'} = "Bearer";

my $api_instance = VericredClient::DrugsApi->new();
my $ndc_package_code = '12345-4321-11'; # string | NDC package code
my $audience = 'individual'; # string | Two-character state code
my $state_code = 'NY'; # string | Two-character state code

eval { 
    my $result = $api_instance->get_drug_coverages(ndc_package_code => $ndc_package_code, audience => $audience, state_code => $state_code);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DrugsApi->get_drug_coverages: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ndc_package_code** | **string**| NDC package code | 
 **audience** | **string**| Two-character state code | 
 **state_code** | **string**| Two-character state code | 

### Return type

[**DrugCoverageResponse**](DrugCoverageResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_drugs**
> DrugSearchResponse list_drugs(search_term => $search_term)

Drug Search

Search for drugs by proprietary name

### Example 
```perl
use Data::Dumper;

# Configure API key authorization: Vericred-Api-Key
$VericredClient::Configuration::api_key->{'Vericred-Api-Key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$VericredClient::Configuration::api_key_prefix->{'Vericred-Api-Key'} = "Bearer";

my $api_instance = VericredClient::DrugsApi->new();
my $search_term = 'Zyrtec'; # string | Full or partial proprietary name of drug

eval { 
    my $result = $api_instance->list_drugs(search_term => $search_term);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DrugsApi->list_drugs: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search_term** | **string**| Full or partial proprietary name of drug | 

### Return type

[**DrugSearchResponse**](DrugSearchResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

