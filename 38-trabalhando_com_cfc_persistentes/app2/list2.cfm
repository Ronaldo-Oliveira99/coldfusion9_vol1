<!---
Module: list2.cfm      
Author: Raymond Camden         
Function:List all directors    
--->
 

 
<cfset directors = entityLoad("Director")>
 <cfloop index="director" array="#directors#">
    <cfoutput>
    #director.getLastName()#, #director.getFirstName()#<br/>
    </cfoutput>
 </cfloop>