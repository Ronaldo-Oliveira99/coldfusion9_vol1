<!---
 Filename: SearchForm1.cfm
 Created by: Nate Weiss (NMW)
 Please Note Maintains 'last' search via Client variables
--->

<!--- Determine value for 'Search Prefill' feature --->
<!--- When user submits form, save search criteria in client variable --->
<cfif isDefined('form.searchCriteria')>
 <cfset client.lastSearch = form.searchCriteria>
 <cfset searchPreFill = form.searchCriteria>

<!--- If not submitting yet, get prior search word (if possible) --->
<cfelseif isDefined('client.lastSearch')>
 <CFSET searchPreFill = client.lastSearch>

<!--- If no prior search criteria exists, just show empty string --->
<cfelse>
 <cfset searchPreFill = ''>
</cfif>


<html>
<head><title>Search Orange Whip</title></head>
<body>
 <h2>Search Orange Whip</h2>

 <!--- Simple search form, which submits back to this page --->
 <cfoutput>
 <form action='#cgi.script_name#' method='post'>

 <!--- 'Search Criteria' field --->
 Search For:
 <input name='SearchCriteria' value='#searchPreFill#'>
 
 <!--- Submit button --->
 <input type='submit' value='Search'><br>
 </cfoutput>

 </form>

</body>
</html>
