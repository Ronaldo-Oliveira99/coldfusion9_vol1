<!---
Module: listonedirector.cfm      
Author: Raymond Camden         
Function:List all directors    
--->
 

 
<cfset d = entityNew("director")>
<cfset d.setFirstName("Scott")>
<cfset d.setLastName("Stroz")>
<cfset entitySave(d)>
<cfset idtoload = entityLoad("director",d.getDirectorid())>
<cfdump var="#idtoload#">
<cfset idtoload2 = entityLoad("director",d.getDirectorid(),true)>
<cfdump var="#idtoload2#">