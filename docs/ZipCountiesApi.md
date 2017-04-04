# VericredClient::ZipCountiesApi

## Load the API package
```perl
use VericredClient::Object::ZipCountiesApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_zip_counties**](ZipCountiesApi.md#get_zip_counties) | **GET** /zip_counties | Search for Zip Counties
[**show_zip_county**](ZipCountiesApi.md#show_zip_county) | **GET** /zip_counties/{id} | Show an individual ZipCounty


# **get_zip_counties**
> ZipCountiesResponse get_zip_counties(zip_prefix => $zip_prefix)

Search for Zip Counties

Our `Plan` endpoints require a zip code and a fips (county) code.  This is because plan pricing requires both of these elements.  Users are unlikely to know their fips code, so we provide this endpoint to look up a `ZipCounty` by zip code and return both the selected zip and fips codes.

### Example 
```perl
use Data::Dumper;
use VericredClient::Configuration;
use VericredClient::ZipCountiesApi;

# Configure API key authorization: Vericred-Api-Key
$VericredClient::Configuration::api_key->{'Vericred-Api-Key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$VericredClient::Configuration::api_key_prefix->{'Vericred-Api-Key'} = "Bearer";

my $api_instance = VericredClient::ZipCountiesApi->new();
my $zip_prefix = '1002'; # string | Partial five-digit Zip

eval { 
    my $result = $api_instance->get_zip_counties(zip_prefix => $zip_prefix);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ZipCountiesApi->get_zip_counties: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **zip_prefix** | **string**| Partial five-digit Zip | 

### Return type

[**ZipCountiesResponse**](ZipCountiesResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **show_zip_county**
> ZipCountyResponse show_zip_county(id => $id)

Show an individual ZipCounty

Our `Plan` endpoints require a zip code and a fips (county) code.  This is because plan pricing requires both of these elements.  Users are unlikely to know their fips code, so we provide this endpoint to returns the details for a `ZipCounty` by zip code and return both the selected zip and fips codes.

### Example 
```perl
use Data::Dumper;
use VericredClient::Configuration;
use VericredClient::ZipCountiesApi;

# Configure API key authorization: Vericred-Api-Key
$VericredClient::Configuration::api_key->{'Vericred-Api-Key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$VericredClient::Configuration::api_key_prefix->{'Vericred-Api-Key'} = "Bearer";

my $api_instance = VericredClient::ZipCountiesApi->new();
my $id = 12345; # int | Unique ID for ZipCounty

eval { 
    my $result = $api_instance->show_zip_county(id => $id);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ZipCountiesApi->show_zip_county: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Unique ID for ZipCounty | 

### Return type

[**ZipCountyResponse**](ZipCountyResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

