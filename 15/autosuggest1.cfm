<!---
Name:        autosuggest1.cfm
Author:      Ben Forta (ben@forta.com)
Description: Basic auto-suggest
Created:     01/01/2010
--->

<!--- Get ratings --->
<cfquery datasource='ows_oracle' name='ratings'>
SELECT Rating
FROM FilmsRatings
ORDER BY Rating
</cfquery>
<!--- Convert to list --->
<cfset list=ValueList(ratings.Rating)>

<!--- Page header --->
<cfinclude template='header.cfm'>

<!--- Search form --->
<cfform>

<table align='center' bgcolor='orange'>
 <tr>
  <th colspan='2'>
   <font size='+1'>Find a Movie</font>
  </th>
 </tr>
 <tr>
  <td>
   Rating:
  </td>
  <td>
   <cfinput type='Text'
            name='Rating'
            autosuggest='#list#'
            size='50'
            maxlength='100'>
  </td>
 </tr>
 <tr>
  <td colspan='2' align='center'>
   <input type='submit' value='Search'>
  </td>
   </tr>
</table>

</cfform>

<!--- Page footer --->
<cfinclude template='footer.cfm'>
