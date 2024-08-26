<!--- 
 Filename: ServerSideCache.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates use of server-side caching
--->

<!--- Cache this template for 30 seconds at a time --->
<cfcache
 action="ServerCache"
 timespan="#createTimeSpan(0, 0, 0, 30)#">
 
<html>
<head><title>Caching Demonstration</title></head>
<body>

 <!--- Display the current time --->
 <p>This page was generated at:
 <cfoutput>#timeFormat(now(), "h:mm:ss tt")#</cfoutput>

</body>
</html>
