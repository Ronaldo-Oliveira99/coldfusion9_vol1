<!---
Filename: showDirector.cfm
Author: Ken Fricklas (KF)
Purpose: Show the director
--->
<cfset cfcDirector = new Director()>
<cfoutput>#cfcDirector.showPerson()#</cfoutput>