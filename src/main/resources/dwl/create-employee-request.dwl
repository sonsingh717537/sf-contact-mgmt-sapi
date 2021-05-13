%dw 2.0
output application/java
fun dateCoversion (dateValue) = if (not (isEmpty(dateValue))) dateValue as Date {format : "MM/dd/yyyy"} as String {format : "yyyy-MM-dd"} else null
---
[{
	Unique_Id__c : vars.uniqueId,
	FirstName__c : payload.identification.firstName default "",
	LastName__c : payload.identification.lastName default "",
	Gender__c : payload.identification.gender default "",
	DOB__c : dateCoversion(payload.identification.dob default "") as Date ,
	Title__c: payload.identification.title default ""
}]