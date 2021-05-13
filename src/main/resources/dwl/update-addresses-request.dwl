%dw 2.0
output application/java
---
(payload.address map (value, key) -> using (existingAddress = (vars.sfAddressesOfAnEmployeeResponse filter $.Type__c == value."type")) {
	(Id : existingAddress[0].Id) if (not (isEmpty(existingAddress))),
	Unique_Id__c : if (not (isEmpty(existingAddress))) existingAddress[0].Unique_Id__c else uuid(),
	Type__c : value."type",
	Number__c : value."number",
	Street__c : value.street,
	Unit__c : value.unit,
	City__c : value.city,
	State__c : value.state,
	Zipcode__c : value.zipcode,
	(Name__c : vars.sfAnEmployeeResponse[0].Id) if (isEmpty(existingAddress))
})