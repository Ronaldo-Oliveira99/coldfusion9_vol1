<!---
 Filename: CookieShow.cfm
 Created by: Nate Weiss (NMW)
 Please Note Displays the value of the TimeVisitStart cookie,
 which gets set by CookieSet.cfm
--->

<html>
<head><title>Cookie Demonstration</title></head>
<body>

<cfoutput>
 You started your visit at:
 #cookie.VisitStart#<br>
</cfoutput>

</body>
</html>
