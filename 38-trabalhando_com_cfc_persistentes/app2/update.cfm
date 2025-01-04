<!---
Module: update.cfm      
Author: Raymond Camden         
Function:List all directors    
--->
 

<!--- sort by last name ---> 
<cfset d = entityNew("director")>
<cfset d.setFirstName("Raymond56")>
<cfset d.setLastName("Vader")>
<cfset entitySave(d)>
<cfdump var="#d#" label="Director entity after it was saved.">
<cfset d.setFirstName("Todd")>
<cfset d.setLastName("Sharp")>
<cfdump var="#d#" label="Director entity after it was updated.">