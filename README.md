### Contact API : Employee data in Salesforce ###

Contact Management API facilitates employee data movement to Salesforce system by making API calls to the Contact system API.

### Assumptions ###

This document assumes that you are familiar with Mule and the [Salesforce Connector](https://docs.mulesoft.com/salesforce-connector/0.3.6/salesforce-connector-reference).Further, this example assumes that you have a basic understanding of [Mule flows](http://www.mulesoft.org/documentation/display/current/Mule+Application+Architecture), [Mule Global Elements](http://www.mulesoft.org/documentation/display/current/Global+Elements), and [Anypoint DataWeave](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation). 

This document describes the details of Contact Management API.

### Use Case ###

The application supports following operations : Create an employee, Get all employees, Get an employee, Update an employee and accepts json request for create and update operations. These operations will be performed against salesforce instance.

### Set Up and Run the Application ###

1. Download the project source code from github repository.

2. Provide salesforce credentials in configuration files. Configuration files are environment specific and respective salesforce instance credentials needs to be added/updated in configuration files. Change the contents of the **username**, **password** **securityToken**and **hostname** fields to your account-specific values as follows:

		username					<USERNAME>
		securityToken					<SALESFORCE TOKEN> - Salesforce : Authorization token
		password					<PASSWORD>
		url						<URL> - for example https://test.salesforce.com/

3. Salesforce credentials information needs to be stored in encrypted form. MuleSoft provided utility [Secure Properties Tool Jar file](https://docs.mulesoft.com/downloads/mule-runtime/4.2/secure-properties-tool.jar) can be used to encrypt credentials. For more information on encryption process please [refer](https://docs.mulesoft.com/mule-runtime/4.3/secure-configuration-properties). **Sample command** : java -cp secure-properties-tool.jar com.mulesoft.tools.SecurePropertiesTool string encrypt Blowfish CBC <secure key> <value to be encrypted>

4. This application supports **Blowfish** algorithm and **CBC** mode for encryption.

5. **SOQL queries** are defined in the configuration and can be changed in configuration files as per the requirement.

6. Post configuration changes, project is ready to be deployed on mule server.
	
	**Deploy in studio** - [how to deploy mule application in studio](http://workshop.tools.mulesoft.com/modules/module3_lab3#step-1-run-the-api)
	
	**Deploy on mule server** - To deploy application on mule server. Create Deployable Mule Application by any of the below methods -
	
		a. **Using Command Prompt** - mvn clean install -Dsecure.key=<changeit> -Denv=dev
		b. **Using Anypoint Studio** - [Create Deployable Mule Archive](https://docs.mulesoft.com/studio/7.9/import-export-packages#export-project-studio)
	
	**Note** : Make sure to pass below environment variables while deploying the application.
		
		a. secure.key 	<SECURE KEY> - Secure key used to encrypt values needs to be passed as environment variable while deployment like **secure.key** = **changeit**
		b. env 		<Environment> - Environment on which application is being deployed. Permissible values - [dev, sit, uat, prod]. By default dev configuration will be enabled.

7. Make a request (POST, PUT, GET (an employee), GET (all employees)) to request to *http://localhost:8090/api/ with the 'Content-Type' header set as 'application/json'

	To send this request, use a browser extension such as [Advanced Rest Client](https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo) (Google Chrome), or the [curl](http://curl.haxx.se/) command line utility.

8. Login to your salesforce account. Navigate to View Employee object and verify the results.

Follow [the procedure](http://www.mulesoft.org/documentation/display/current/Importing+and+Exporting+in+Studio#ImportingandExportinginStudio-ExportingStudioDocumentation) to export auto-generated Studio documentation.

### Go Further ###

- Postman collection to test this API : api_test.postman_collection.json inside documentation folder of the project
- Learn more about [Anypoint DataWeave](https://developer.mulesoft.com/docs/display/current/DataWeave+Reference+Documentation).
