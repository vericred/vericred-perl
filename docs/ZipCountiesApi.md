# VericredClient::ZipCountiesApi

## Load the API package
```perl
use VericredClient::Object::ZipCountiesApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**zip_counties_get**](ZipCountiesApi.md#zip_counties_get) | **GET** /zip_counties | Find Zip Counties by Zip Code


# **zip_counties_get**
> InlineResponse2002 zip_counties_get(zip_prefix => $zip_prefix)

Find Zip Counties by Zip Code

### Finding Zip Code and Fips Code

Our `Plan` endpoints require a zip code and a fips (county) code.  This is
because plan pricing requires both of these elements.  Users are unlikely to
know their fips code, so we provide this endpoint to look up a `ZipCounty` by
zip code and return both the selected zip and fips codes.



### Example 
```perl
use Data::Dumper;

my $api_instance = VericredClient::ZipCountiesApi->new();
my $zip_prefix = 'zip_prefix_example'; # string | Partial five-digit Zip

eval { 
    my $result = $api_instance->zip_counties_get(zip_prefix => $zip_prefix);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ZipCountiesApi->zip_counties_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **zip_prefix** | **string**| Partial five-digit Zip | 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

