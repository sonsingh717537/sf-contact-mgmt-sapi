%dw 2.0
output application/json
fun dateCoversion (dateValue) = if (not (isEmpty(dateValue))) dateValue as Date {format : "yyyy-MM-dd"} as String {format : "MM/dd/yyyy"} else null
---
(vars.sfAllEmployeeResponse default [] map (emp, empKey) -> using (addressArray = (vars.sfAddressesOfAllEmployeesResponse filter $.Name__c == emp.Id)) {
    identification: {
    	"firstName": emp.FirstName__c,
		"lastName": emp.LastName__c,
		"dob": dateCoversion(emp.DOB__c),
		"gender": emp.Gender__c,
		"title": emp.Title__c
    },
    (address: ((addressArray default []) map (addr, addrKey) -> {
        "type": addr.Type__c,
        "number": if ( not (isEmpty(addr.Number__c)) ) floor(addr.Number__c) else 0,
		"street": addr.Street__c,
		"unit": addr.Unit__c,
		"city": addr.City__c,
		"state": addr.State__c,
		"zipcode": addr.Zipcode__c
      })) if (not isEmpty(addressArray))
  })