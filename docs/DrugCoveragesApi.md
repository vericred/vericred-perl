# VericredClient::DrugCoveragesApi

## Load the API package
```perl
use VericredClient::Object::DrugCoveragesApi;
```

All URIs are relative to *https://api.vericred.com/*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_drug_coverages**](DrugCoveragesApi.md#get_drug_coverages) | **GET** /drug_packages/{ndc_package_code}/coverages | Search for DrugCoverages


# **get_drug_coverages**
> DrugCoverageResponse get_drug_coverages(ndc_package_code => $ndc_package_code, audience => $audience, state_code => $state_code)

Search for DrugCoverages

Drug Coverages are the specific tier level, quantity limit, prior authorization and step therapy for a given Drug/Plan combination. This endpoint returns all DrugCoverages for a given Drug.  #### Tiers   Possible values for tier:    | Tier                     | Description                                                                                                                                                                     |   | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |   | __generic__              | Unbranded drugs, with the same active ingredients as their brand-name equivalents, and generally available at a lower cost.                                                     |   | __preferred_brand__      | Brand-name drugs included on the health plan's formulary. Generally more expensive than generics, and less expensive than non-preferred drugs.                                  |   | __non_preferred_brand__  | Brand-name drugs not included on the health plan's formulary. These generally have a higher coinsurance.                                                                        |   | __specialty__            | Used to treat complex conditions like cancer. May require special handling or monitoring. May be generic or brand-name. Generally the most expensive drugs covered by a plan.   |   | __not_covered__          | Specifically excluded from the health plan.                                                                                                                                     |   | __not_listed__           | Neither included nor excluded from the health plan. Most plans provide some default level of coverage for unlisted drugs.                                                       |

### Example 
```perl
use Data::Dumper;
use VericredClient::Configuration;
use VericredClient::DrugCoveragesApi;

# Configure API key authorization: Vericred-Api-Key
$VericredClient::Configuration::api_key->{'Vericred-Api-Key'} = 'YOUR_API_KEY';
# uncomment below to setup prefix (e.g. Bearer) for API key, if needed
#$VericredClient::Configuration::api_key_prefix->{'Vericred-Api-Key'} = "Bearer";

my $api_instance = VericredClient::DrugCoveragesApi->new();
my $ndc_package_code = '07777-3105-01'; # string | NDC package code
my $audience = 'individual'; # string | Plan Audience (individual or small_group)
my $state_code = 'CA'; # string | Two-character state code

eval { 
    my $result = $api_instance->get_drug_coverages(ndc_package_code => $ndc_package_code, audience => $audience, state_code => $state_code);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DrugCoveragesApi->get_drug_coverages: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ndc_package_code** | **string**| NDC package code | 
 **audience** | **string**| Plan Audience (individual or small_group) | 
 **state_code** | **string**| Two-character state code | 

### Return type

[**DrugCoverageResponse**](DrugCoverageResponse.md)

### Authorization

[Vericred-Api-Key](../README.md#Vericred-Api-Key)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

