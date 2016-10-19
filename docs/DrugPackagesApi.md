# VericredClient::DrugPackagesApi

## Load the API package
```perl
use VericredClient::Object::DrugPackagesApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**show_formulary_drug_package_coverage**](DrugPackagesApi.md#show_formulary_drug_package_coverage) | **GET** /formularies/{formulary_id}/drug_packages/{ndc_package_code} | Formulary Drug Package Search


# **show_formulary_drug_package_coverage**
> FormularyDrugPackageResponse show_formulary_drug_package_coverage(formulary_id => $formulary_id, ndc_package_code => $ndc_package_code)

Formulary Drug Package Search

Search for coverage by Formulary and DrugPackage ID

### Example 
```perl
use Data::Dumper;
use VericredClient::Configuration;
use VericredClient::DrugPackagesApi;

# Configure API key authorization: Vericred-Api-Key
$VericredClient::Configuration::api_key->{'Vericred-Api-Key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$VericredClient::Configuration::api_key_prefix->{'Vericred-Api-Key'} = "Bearer";

my $api_instance = VericredClient::DrugPackagesApi->new();
my $formulary_id = '123'; # string | ID of the Formulary in question
my $ndc_package_code = '07777-3105-01'; # string | ID of the DrugPackage in question

eval { 
    my $result = $api_instance->show_formulary_drug_package_coverage(formulary_id => $formulary_id, ndc_package_code => $ndc_package_code);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DrugPackagesApi->show_formulary_drug_package_coverage: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **formulary_id** | **string**| ID of the Formulary in question | 
 **ndc_package_code** | **string**| ID of the DrugPackage in question | 

### Return type

[**FormularyDrugPackageResponse**](FormularyDrugPackageResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

