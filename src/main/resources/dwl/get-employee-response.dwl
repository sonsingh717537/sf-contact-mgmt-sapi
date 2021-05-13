%dw 2.0
output application/json
fun dateCoversion (dateValue) = if (not (isEmpty(dateValue))) dateValue as Date {format : "yyyy-MM-dd"} as String {format : "MM/dd/yyyy"} else null
---
{
	"identification": {
		"firstName": vars.sfAnEmployeeResponse[0].FirstName__c,
		"lastName": vars.sfAnEmployeeResponse[0].LastName__c,
		"dob": dateCoversion(vars.sfAnEmployeeResponse[0].DOB__c),
		"gender": vars.sfAnEmployeeResponse[0].Gender__c,
		"title": vars.sfAnEmployeeResponse[0].Title__c
	},
	("address": (vars.sfAddressesOfAnEmployeeResponse default [] map {
		"type": $.Type__c,
		"number": if ( not (isEmpty($.Number__c)) ) floor($.Number__c) else 0,
		"street": $.Street__c,
		"unit": $.Unit__c,
		"city": $.City__c,
		"state": $.State__c,
		"zipcode": $.Zipcode__c
	})) if (not (isEmpty(vars.sfAddressesOfAnEmployeeResponse)))
}