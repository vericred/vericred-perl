# VericredClient::NetworksApi

## Load the API package
```perl
use VericredClient::Object::NetworksApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_networks**](NetworksApi.md#list_networks) | **GET** /networks | Networks
[**show_network**](NetworksApi.md#show_network) | **GET** /networks/{id} | Network Details


# **list_networks**
> NetworkSearchResponse list_networks(carrier_id => $carrier_id, page => $page, per_page => $per_page)

Networks

A network is a list of the doctors, other health care providers, and hospitals that a plan has contracted with to provide medical care to its members. This endpoint is paginated.

### Example 
```perl
use Data::Dumper;
use VericredClient::Configuration;
use VericredClient::NetworksApi;

# Configure API key authorization: Vericred-Api-Key
$VericredClient::Configuration::api_key->{'Vericred-Api-Key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$VericredClient::Configuration::api_key_prefix->{'Vericred-Api-Key'} = "Bearer";

my $api_instance = VericredClient::NetworksApi->new();
my $carrier_id = '33333'; # string | Carrier HIOS Issuer ID
my $page = 1; # int | Page of paginated response
my $per_page = 1; # int | Responses per page

eval { 
    my $result = $api_instance->list_networks(carrier_id => $carrier_id, page => $page, per_page => $per_page);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling NetworksApi->list_networks: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **carrier_id** | **string**| Carrier HIOS Issuer ID | 
 **page** | **int**| Page of paginated response | [optional] 
 **per_page** | **int**| Responses per page | [optional] 

### Return type

[**NetworkSearchResponse**](NetworkSearchResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **show_network**
> NetworkDetailsResponse show_network(id => $id)

Network Details

A network is a list of the doctors, other health care providers, and hospitals that a plan has contracted with to provide medical care to its members.

### Example 
```perl
use Data::Dumper;
use VericredClient::Configuration;
use VericredClient::NetworksApi;

# Configure API key authorization: Vericred-Api-Key
$VericredClient::Configuration::api_key->{'Vericred-Api-Key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$VericredClient::Configuration::api_key_prefix->{'Vericred-Api-Key'} = "Bearer";

my $api_instance = VericredClient::NetworksApi->new();
my $id = 100001; # int | Primary key of the network

eval { 
    my $result = $api_instance->show_network(id => $id);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling NetworksApi->show_network: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Primary key of the network | 

### Return type

[**NetworkDetailsResponse**](NetworkDetailsResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

