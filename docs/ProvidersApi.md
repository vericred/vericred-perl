# VericredClient::ProvidersApi

## Load the API package
```perl
use VericredClient::Object::ProvidersApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_provider**](ProvidersApi.md#get_provider) | **GET** /providers/{npi} | Find a Provider
[**get_providers**](ProvidersApi.md#get_providers) | **POST** /providers/search | Find Providers


# **get_provider**
> ProviderShowResponse get_provider(npi => $npi, vericred_api_key => $vericred_api_key)

Find a Provider

To retrieve a specific provider, just perform a GET using his NPI number

### Example 
```perl
use Data::Dumper;

my $api_instance = VericredClient::ProvidersApi->new();
my $npi = '1234567890'; # string | NPI number
my $vericred_api_key = 'api-doc-key'; # string | API Key

eval { 
    my $result = $api_instance->get_provider(npi => $npi, vericred_api_key => $vericred_api_key);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ProvidersApi->get_provider: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **npi** | **string**| NPI number | 
 **vericred_api_key** | **string**| API Key | [optional] 

### Return type

[**ProviderShowResponse**](ProviderShowResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_providers**
> ProvidersSearchResponse get_providers(body => $body)

Find Providers

All `Provider` searches require a `zip_code`, which we use for weighting
the search results to favor `Provider`s that are near the user.  For example,
we would want "Dr. John Smith" who is 5 miles away to appear before
"Dr. John Smith" who is 100 miles away.

The weighting also allows for non-exact matches.  In our prior example, we
would want "Dr. Jon Smith" who is 2 miles away to appear before the exact
match "Dr. John Smith" who is 100 miles away because it is more likely that
the user just entered an incorrect name.

The free text search also supports Specialty name search and "body part"
Specialty name search.  So, searching "John Smith nose" would return
"Dr. John Smith", the ENT Specialist before "Dr. John Smith" the Internist.


### Example 
```perl
use Data::Dumper;

my $api_instance = VericredClient::ProvidersApi->new();
my $body = VericredClient::Object::RequestProvidersSearch->new(); # RequestProvidersSearch | 

eval { 
    my $result = $api_instance->get_providers(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ProvidersApi->get_providers: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**RequestProvidersSearch**](RequestProvidersSearch.md)|  | [optional] 

### Return type

[**ProvidersSearchResponse**](ProvidersSearchResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

