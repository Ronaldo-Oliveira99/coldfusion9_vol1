
<!---
    Module:  consultar.cfm 
    Author: Raymond Camden       
    Function: Create a new director entity.  
--->

<!--- <cfset d = new model.Pessoa()> --->

<cfset d = entityNew("Pessoa")>
<cfdump var="#d#" label="New Director.">

<!--- <cfset d.SETDIRECTORID("45")>
<cfset d.setFirstName("Raymond")>
<cfset d.setLastName("Vader")>  --->

<cfdump var="#d#" label="Modified Director.">
