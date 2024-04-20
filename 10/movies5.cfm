<!---
Name:        movies5.cfm
Author:      Ben Forta (ben@forta.com)
Description: Data-driven HTML table
Created:     01/01/2010
--->

<!--- Get movie list from database --->
<cfquery name='movies' datasource='ows'>
SELECT MovieTitle, PitchText,
       Summary, DateInTheaters
FROM Films 
ORDER BY MovieTitle
</cfquery>

<!--- Create HTML page --->
<html>
<head>
 <title>Orange Whip Studios - Movie List</title>
</head>

<body>

<!--- Start table --->
<table>
 <tr>
  <th colspan='2'>
   <h2>Movie List</h2>
  </th>
 </tr>
 <!--- loop through movies --->
 <cfoutput query='movies'>
  <tr bgcolor='##cccccc'>
   <td>
    <strong>#MovieTitle#</strong>
    <br>
    #PitchText#
   </td>
   <td>
    #DateFormat(DateInTheaters)#
   </td>
  </tr>
  <tr>
   <td colspan='2'>
    #Summary#
   </td>
  </tr>
 </cfoutput>
 <!--- End of movie loop --->
</table>

</body>
</html>
