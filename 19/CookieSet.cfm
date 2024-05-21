<!---
 Filename: CookieSet.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Sets a cookie to remember time of this page request
--->

<html>
<head><title>Cookie Demonstration</title></head>
<body>

<!--- Set a cookie to remember the time right now --->

<!--- <cfset cookie.TimeVisitStart = timeFormat(now(), 'h:mm:ss tt')> --->

<!--- <cfif  not  isDefined(?cookie.VisitStart?)>
    <cfset  cookie.VisitStart  =  now()>
</cfif> --->

<!--- OU --->

<cfparam  name='cookie.VisitStart'  type='date'  default='#now()#'>



The cookie has been set.

</body>
</html>
