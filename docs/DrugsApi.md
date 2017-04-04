# VericredClient::DrugsApi

## Load the API package
```perl
use VericredClient::Object::DrugsApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_drugs**](DrugsApi.md#list_drugs) | **GET** /drugs | Drug Search


# **list_drugs**
> DrugSearchResponse list_drugs(search_term => $search_term)

Drug Search

Search for drugs by proprietary name

### Example 
```perl
use Data::Dumper;
use VericredClient::Configuration;
use VericredClient::DrugsApi;

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

