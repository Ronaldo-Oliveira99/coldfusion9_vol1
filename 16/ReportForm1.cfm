<!---
Name:        ReportForm1.cfm
Author:      Ben Forta
Description: Report form front-end
Created:     01/01/2010
--->

<!--- Get movie list --->
<cfquery datasource='ows_oracle' name='movies'>
SELECT FilmID, MovieTitle
FROM Films
ORDER BY MovieTitle
</cfquery>


<html>

<head>
<title>Orange Whip Studios Expenses Report</title>
</head>

<body>

<cfform action='Report3.cfm'>
Select movie:
<cfselect name='FilmID'
          query='movies'
          display='MovieTitle'
          value='FilmID'
          queryPosition='below'>
 <option value=''>--- ALL ---</option>
</cfselect>
<br>
<cfinput name='sbmt'
         type='submit'
         value='Report'>
</cfform>

</body>

</html>