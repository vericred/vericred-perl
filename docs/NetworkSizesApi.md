# VericredClient::NetworkSizesApi

## Load the API package
```perl
use VericredClient::Object::NetworkSizesApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_state_network_sizes**](NetworkSizesApi.md#list_state_network_sizes) | **GET** /states/{state_id}/network_sizes | State Network Sizes
[**search_network_sizes**](NetworkSizesApi.md#search_network_sizes) | **POST** /network_sizes/search | Network Sizes


# **list_state_network_sizes**
> StateNetworkSizeResponse list_state_network_sizes(state_id => $state_id, page => $page, per_page => $per_page)

State Network Sizes

The number of in-network Providers for each network in a given state. This data is recalculated nightly.  The endpoint is paginated.

### Example 
```perl
use Data::Dumper;
use VericredClient::Configuration;
use VericredClient::NetworkSizesApi;

# Configure API key authorization: Vericred-Api-Key
$VericredClient::Configuration::api_key->{'Vericred-Api-Key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$VericredClient::Configuration::api_key_prefix->{'Vericred-Api-Key'} = "Bearer";

my $api_instance = VericredClient::NetworkSizesApi->new();
my $state_id = 'CA'; # string | State code
my $page = 1; # int | Page of paginated response
my $per_page = 1; # int | Responses per page

eval { 
    my $result = $api_instance->list_state_network_sizes(state_id => $state_id, page => $page, per_page => $per_page);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling NetworkSizesApi->list_state_network_sizes: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **state_id** | **string**| State code | 
 **page** | **int**| Page of paginated response | [optional] 
 **per_page** | **int**| Responses per page | [optional] 

### Return type

[**StateNetworkSizeResponse**](StateNetworkSizeResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_network_sizes**
> StateNetworkSizeResponse search_network_sizes(body => $body)

Network Sizes

The number of in-network Providers for each network/state combination provided. This data is recalculated nightly.

### Example 
```perl
use Data::Dumper;
use VericredClient::Configuration;
use VericredClient::NetworkSizesApi;

# Configure API key authorization: Vericred-Api-Key
$VericredClient::Configuration::api_key->{'Vericred-Api-Key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$VericredClient::Configuration::api_key_prefix->{'Vericred-Api-Key'} = "Bearer";

my $api_instance = VericredClient::NetworkSizesApi->new();
my $body = VericredClient::Object::StateNetworkSizeRequest->new(); # StateNetworkSizeRequest | 

eval { 
    my $result = $api_instance->search_network_sizes(body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling NetworkSizesApi->search_network_sizes: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**StateNetworkSizeRequest**](StateNetworkSizeRequest.md)|  | 

### Return type

[**StateNetworkSizeResponse**](StateNetworkSizeResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

