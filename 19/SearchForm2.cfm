<!---
 Filename: SearchForm2.cfm
 Created by: Nate Weiss (NMW)
 Please Note Maintains 'last' search via Client variables
--->

<!--- 
  When user submits form, save search criteria in Client variable 
--->
<cfif isDefined('form.searchCriteria')>
 <cfset client.lastSearch = form.searchCriteria>
 <cfset client.lastMaxRows = form.searchMaxRows>
<!--- if not submitting yet, get prior search word (if possible) --->
<cfelseif isDefined('client.lastSearch') and 
          isDefined('client.lastMaxRows')>
 <cfset searchCriteria = client.lastSearch>
 <cfset searchMaxRows = client.lastMaxRows>
<!--- if no prior search criteria exists, just show empty string --->
<cfelse>
 <cfset searchCriteria = ''>
 <cfset searchMaxRows = 10>
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
<input name='SearchCriteria' value='#searchCriteria#'>

<!--- 'Max Matches' field --->
<i>show up to
<input name='SearchMaxRows' value='#searchMaxRows#' size='2'>
matches</i><br>

<!--- Submit button --->
<input type='Submit' value='Search'><br>

</form>
</cfoutput>

<!--- If we have something to search for, do it now --->
<cfif searchCriteria neq ''>
  <!--- Get matching film entries from database --->
  <cfquery name='getMatches'>
  SELECT FilmID, MovieTitle, Summary
  FROM Films
  WHERE MovieTitle LIKE 
  <cfqueryparam cfsqltype='cf_sql_varchar' value='%#SearchCriteria#%'>
  OR Summary LIKE 
  <cfqueryparam cfsqltype='cf_sql_varchar' value='%#SearchCriteria#%'>
  ORDER BY MovieTitle
  </cfquery>

  <!--- Show number of matches --->
  <cfoutput>
  <hr><i>#getMatches.recordCount# records found for
  '#searchCriteria#'</i><br>
  </cfoutput>

  <!--- Show matches, up to maximum number of rows --->
  <cfoutput query='getMatches' maxrows='#searchMaxRows#'>
  <p><b>#MovieTitle#</b><br>
  #Summary#<br>
  </cfoutput>
</cfif>

</body>
</html>
