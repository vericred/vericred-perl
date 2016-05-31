# VericredClient::NetworksApi

## Load the API package
```perl
use VericredClient::Object::NetworksApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**list_networks**](NetworksApi.md#list_networks) | **GET** /networks | Networks


# **list_networks**
> NetworkSearchResponse list_networks(carrier_id => $carrier_id)

Networks

A network is a list of the doctors, other health care providers,
and hospitals that a plan has contracted with to provide medical care to
its members.

### Example 
```perl
use Data::Dumper;

my $api_instance = VericredClient::NetworksApi->new();
my $carrier_id = '33333'; # string | Carrier HIOS Issuer ID

eval { 
    my $result = $api_instance->list_networks(carrier_id => $carrier_id);
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

### Return type

[**NetworkSearchResponse**](NetworkSearchResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

