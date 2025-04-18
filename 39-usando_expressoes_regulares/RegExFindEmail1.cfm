<!--- 
 Filename: RegExFindEmail1.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates basic use of reFind()
--->

<html>
<head><title>Using a Regular Expression</title></head>
<body>

<!--- The text to search --->
<cfset text = "My email address is nate@nateweiss.com. Write to me anytime.">

<!--- Attempt to find a match --->
<cfset foundPos = reFind("([\w._]+)@([\w_]+(\.[\w_]+)+)", text)>
<cfset foundPos = reFind("Wr", text)>
<cfset foundPos = reFindNoCase("([\w_]+)", text)>

<cfdump  var="#foundPos#">
<!--- Display the result --->
<cfif foundPos gt 0>
 <cfoutput>
 <p>A match was found at position #foundPos#.</p>
 </cfoutput>
<cfelse> 
 <p>No matches were found.</p>
</cfif> 

</body>
</html> 
