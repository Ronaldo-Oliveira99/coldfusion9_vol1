<!--- 
 Filename: RegExFindEmail2a.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates use of RegExFunctions.cfm library
--->

<html>
<head><title>Using a Regular Expression</title></head>
<body>

<!--- Include UDF library of regular expression functions --->
<!--- This allows us to use the REFindString() function --->
<cfinclude template="RegExFunctions.cfm">

<!--- The text to search --->
<cfset text = "My email address is nate@nateweiss.com. Write to me anytime.">

<!--- Attempt to find a match --->
<cfset matchedString = reFindString("([\w._]+)\@([\w_]+(\.[\w_]+)+)", text)>

<!--- Display the result --->
<cfif matchedString neq "">
 <cfoutput><p>A match was found: #matchedString#</p></cfoutput>
<cfelse> 
 <p>No matches were found.</p>
</cfif> 

</body>
</html>
