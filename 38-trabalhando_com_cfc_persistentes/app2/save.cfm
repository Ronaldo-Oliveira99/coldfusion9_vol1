<!---
    Module:  save.cfm 
    Author: Raymond Camden       
    Function: Create a new director entity.  
--->
<!---  --->
<!--- <cfset d = entityNew("director")> --->
<cfset d = new Director()>
<cfset d.setFirstName("Raymond")>
<cfset d.setLastName("Vader")>
<cfdump var="#d#" label="Modified Director">
<cfset entitySave(d)>
<cfdump var="#d#" label="Director entity after it was saved.">
