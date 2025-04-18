<!---
Name:        details2.cfm
Author:      Ben Forta (ben@forta.com)
Description: Data drill-down details
             with basic validation
Created:     01/01/2010
--->

<!--- Make sure FilmID was passed --->
<cfif not IsDefined('URL.filmid')>
 <!--- it wasn�t, send to movie list --->
 <cflocation url='movies6.cfm'>
</cfif>

<!--- Get a movie from database --->
<cfquery name='movie' datasource='ows_oracle'>
SELECT FilmID, MovieTitle,
       PitchText, Summary,
       DateInTheaters, AmountBudgeted
FROM Films
WHERE FilmID=#URL.FilmID#
</cfquery>

<!--- Create HTML page --->
<html>
<head>
 <title>Orange Whip Studios - Movie Details</title>
</head>

<body>

<!--- Display movie details --->
<cfoutput query='movie'>

<table>
 <tr>
  <td colspan='2'>
   <img src='../images/f#filmid#.gif'
        alt='#movietitle#'
        align='middle'>
   <b>#MovieTitle#</b>
  </td>
 </tr>
 <tr valign='top'>
  <th align='right'>Tag line:</th>
  <td>#PitchText#</td>
 </tr>
 <tr valign='top'>
  <th align='right'>Summary:</th>
  <td>#Summary#</td>
 </tr>
 <tr valign='top'>
  <th align='right'>Released:</th>
  <td>#DateFormat(DateInTheaters)#</td>
 </tr>
 <tr valign='top'>
  <th align='right'>Budget:</th>
  <td>#DollarFormat(AmountBudgeted)#</td>
 </tr>
</table>

</cfoutput>

</body>
</html>
