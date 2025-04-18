<!---
Name:        movies3.cfm
Author:      Ben Forta (ben@forta.com)
Description: Data-driven HTML list
Created:     01/01/2010
--->

<!--- Get movie list from database --->
<cfquery name='movies' datasource='ows_oracle'>
SELECT MovieTitle, PitchText
FROM Films 
ORDER BY MovieTitle
</cfquery>

<!--- Create HTML page --->
<html>
<head>
 <title>Orange Whip Studios - Movie List</title>
</head>

<body>

<h1>Movie List</h1>

<!--- Display movie list --->
<ul>
 <cfoutput query='movies'>
  <li><strong>#MovieTitle#</strong> - #PitchText#</li>
 </cfoutput>
</ul>

</body>
</html>
