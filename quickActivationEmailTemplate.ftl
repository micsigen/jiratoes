<html>
<head>
  <title>quickActivationEmailTemplate</title>
</head>
<body>
  <p>name: ${model.customerParty.prefix} ${model.customerParty.lastName} ${model.customerParty.firstName}</p> 
  <p>msisdn: ${model.msisdn}</p>
  <p>remaining limit: ${model.remainingLimit}</p>
  <p>registration due date: ${model.registrationDueDate?string('yyyy.MM.dd')}</p>
  <p>phone number: ${model.msisdn}</p>
  <p>type: 
  <#switch model.customerParty.type>
  	<#case "RESIDENTAL">
  		residental
  		<#break>
  	<#case "COMPANY">
  		company
  		<#break>
  	<#case "PRIVATE_ENTERPRISE">
  		private enterprise
  		<#break>
  	<#case "OTHER">
  		private enterprise
  		<#break>
  	<#default>
        
  </#switch>
  </p>
  <p>name: ${model.customerParty.prefix} ${model.customerParty.lastName} ${model.customerParty.firstName}</p>
  <p>e-mail: ${model.customerParty.email}</p>
  <p>document type: 
  <#switch model.customerParty.personalDocumentType>
  	<#case "PERSONAL_IDENTIFICATION_CARD">
  		personal identification card
  		<#break>
  	<#case "DRIVING_LICENCE">
  		driving licence
  		<#break>
  	<#case "PASSPORT">
  		passport
  		<#break>
  	<#case "FOREIGN_PASSPORT">
  		foreign passport
  		<#break>
  	<#default>
        
  </#switch>
  </p>
  <p>document number: ${model.customerParty.documentNumber}</p>
  <p>birth place: ${model.customerParty.placeOfBirth}</p>
  <p>birth date: ${model.customerParty.dateOfBirth?string('yyyy.MM.dd')}</p>
  <p>mother's name: ${model.customerParty.mothersName}</p>
  <p>address: ${model.customerParty.primaryAddress.zip} ${model.customerParty.primaryAddress.city} ${model.customerParty.primaryAddress.concatenatedAddress}</p>
</body>
</html>