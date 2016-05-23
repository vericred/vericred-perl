# VericredClient::Object::State

## Load the model package
```perl
use VericredClient::Object::State;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | Primary Key of State | [optional] 
**name** | **string** | Name of state | [optional] 
**code** | **string** | 2 letter code for state | [optional] 
**fips_number** | **string** | National FIPs number | [optional] 
**last_date_for_individual** | **DateTime** | Last date this state is live for individuals | [optional] 
**last_date_for_shop** | **DateTime** | Last date this state is live for shop | [optional] 
**live_for_business** | **boolean** | Is this State available for businesses | [optional] 
**live_for_consumers** | **boolean** | Is this State available for individuals | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


