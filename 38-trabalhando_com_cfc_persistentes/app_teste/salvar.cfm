<!---
    Module:  save.cfm 
    Author: Raymond Camden       
    Function: Create a new director entity.  
--->
<!---  --->
<cfset d = entityNew("Pessoa")>

<cfset d.SETDIRECTORID("45")>
<cfset d.setFirstName("Raymond")>
<cfset d.setLastName("Vader2")>

<cfdump var="#d#" label="Modified Director">

<cfset entitySave(d)>

<cfdump var="#d#" label="Director entity after it was saved.">
