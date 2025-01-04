<!---
Module: list3.cfm      
Author: Raymond Camden         
Function:List all directors    
--->
 

<cfset vaderpeeps = entityLoad("director", {lastname='Vader'})>
<cfdump var="#vaderpeeps#">