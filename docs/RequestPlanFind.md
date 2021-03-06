# VericredClient::Object::RequestPlanFind

## Load the model package
```perl
use VericredClient::Object::RequestPlanFind;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**applicants** | [**ARRAY[RequestPlanFindApplicant]**](RequestPlanFindApplicant.md) | Applicants for desired plans. | [optional] 
**enrollment_date** | **string** | Date of enrollment | [optional] 
**drug_packages** | [**ARRAY[RequestPlanFindDrugPackage]**](RequestPlanFindDrugPackage.md) | National Drug Code Package Id | [optional] 
**fips_code** | **string** | County code to determine eligibility | [optional] 
**household_income** | **int** | Total household income. | [optional] 
**household_size** | **int** | Number of people living in household. | [optional] 
**ids** | **ARRAY[int]** | List of plan IDs to filter by | [optional] 
**market** | **string** | Type of plan to search for. | [optional] 
**providers** | [**ARRAY[RequestPlanFindProvider]**](RequestPlanFindProvider.md) | List of providers to search for. | [optional] 
**page** | **int** | Selected page of paginated response. | [optional] 
**per_page** | **int** | Results per page of response. | [optional] 
**sort** | **string** | Sort responses by plan field. | [optional] 
**zip_code** | **string** | 5-digit zip code - this helps determine pricing. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


