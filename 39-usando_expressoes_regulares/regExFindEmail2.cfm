<!--- 
 Filename: RegExFindEmail2.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates basic use of REFind()
--->

<html>
<head><title>Using a Regular Expression</title></head>
<body>

<!--- The text to search --->
<cfset text = "My email address is nate@nateweiss.com. Write to me anytime.">

<!--- Attempt to find a match --->
<cfset matchStruct = reFind("([\w._]+)\@([\w_]+(\.[\w_]+)+)", text, 1, True)>
<!--- <cfset matchStruct = reFind("natew", text, 1, True)> --->


<cfdump  var="#matchStruct#">


<!--- Display the result --->
<cfif matchStruct.pos[1] gt 0>
 <cfset foundString = mid(text, matchStruct.pos[1], matchStruct.len[1])>

 <cfdump  var="#foundString#">
 
 <cfoutput>
 <p>A match was found at position #matchStruct.pos[1]#.</p>
 <p>The actual match is: #foundString#</p>
 </cfoutput>
<cfelse> 
 <p>No matches were found.</p>
</cfif> 

</body>
</html>
