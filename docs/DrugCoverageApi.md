# VericredClient::DrugCoverageApi

## Load the API package
```perl
use VericredClient::Object::DrugCoverageApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**drugs_ndc_coverages_get**](DrugCoverageApi.md#drugs_ndc_coverages_get) | **GET** /drugs/{ndc}/coverages | Find Drug Coverages for a given NDC


# **drugs_ndc_coverages_get**
> ARRAY[DrugCoverage] drugs_ndc_coverages_get(ndc => $ndc)

Find Drug Coverages for a given NDC

Drug Coverages are the specific tier level, quantity limit, prior authorization
and step therapy for a given Drug/Plan combination.  This endpoint returns
all DrugCoverages for a given Drug



### Example 
```perl
use Data::Dumper;

my $api_instance = VericredClient::DrugCoverageApi->new();
my $ndc = 'ndc_example'; # string | NDC for a drug

eval { 
    my $result = $api_instance->drugs_ndc_coverages_get(ndc => $ndc);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DrugCoverageApi->drugs_ndc_coverages_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ndc** | **string**| NDC for a drug | 

### Return type

[**ARRAY[DrugCoverage]**](DrugCoverage.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

