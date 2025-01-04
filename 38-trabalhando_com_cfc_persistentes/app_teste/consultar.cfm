
<!---
    Module:  consultar.cfm 
    Author: Raymond Camden       
    Function: Create a new director entity.  
--->

<!--- <cfset d = new model.Pessoa()> --->

<cfquery name="getDirectors">
    select * from ows_directors
</cfquery>

<cfdump var="#getDirectors#" label="New Director.">

<cfset d = entityNew("director")>
<cfdump var="#d#" label="New Director."> 
<cfdump var="#d#" label="Modified Director.">
