# VericredClient::Object::Pricing

## Load the model package
```perl
use VericredClient::Object::Pricing;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**age** | **int** | Age of applicant | [optional] 
**effective_date** | **DateTime** | Effective date of plan | [optional] 
**expiration_date** | **DateTime** | Plan expiration date | [optional] 
**plan_id** | **int** | Foreign key to plans | [optional] 
**premium_child_only** | [**Number**](Number.md) | Child-only premium | [optional] 
**premium_family** | [**Number**](Number.md) | Family premium | [optional] 
**premium_single** | [**Number**](Number.md) | Single-person premium | [optional] 
**premium_single_and_children** | [**Number**](Number.md) | Single person including children premium | [optional] 
**premium_single_and_spouse** | [**Number**](Number.md) | Person with spouse premium | [optional] 
**premium_single_smoker** | [**Number**](Number.md) | Premium for single smoker | [optional] 
**rating_area_id** | **string** | Foreign key to rating areas | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


