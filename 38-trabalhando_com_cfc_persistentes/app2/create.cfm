<!---
Module: create.cfm 
Author: Raymond Camden       
Function: Create a new director entity.
--->


<cfset d = entityNew("Director")>

<cfdump var="#d#" label="Director Entidade">

<!---
<cfset d = createObject('Director')>
<cfset director = createObject("component", "Director")>

<cfdump var="#d#" label="New Director1">
<cfdump var="#director#" label="New Director3">
<cfdump var="#getresults#" label="apache">
--->