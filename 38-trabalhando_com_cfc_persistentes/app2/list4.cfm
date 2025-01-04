<!---
Module: list4.cfm      
Author: Raymond Camden         
Function:List all directors    
--->
 

<!--- sort by last name ---> 
<cfset sortedDirectors = entityLoad("director", {}, "lastname asc")>
 <cfloop index="director" array="#sortedDirectors#">
    <cfoutput>
        #director.getLastName()#, #director.getFirstName()#<br/>
    </cfoutput>
</cfloop>