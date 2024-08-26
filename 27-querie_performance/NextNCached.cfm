<!---
 Filename: NextNCached.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Displays Next N record-navigation interface
 Please Note Includes NextNIncludeBackNext.cfm and NextNIncludePageLinks.cfm --->
 <!--- Retrieve expense records from database --->

 <cfquery name="getExp"
    cachedWithin="#createTimeSpan(0,0,15,0)#" datasource="#application.dataSource#">
    SELECT
    f.FilmID, f.MovieTitle,
    e.Description, e.ExpenseAmount, e.ExpenseDate
    FROM
    Expenses e INNER JOIN Films f
    ON e.FilmID = f.FilmID
    ORDER BY
    e.ExpenseDate DESC
 </cfquery>
 
 <!--- Number of rows to display per Next/Back page --->
 <cfset rowsPerPage = 10> 
<!--- What row to start at? Assume first by default --->
 <cfparam name="url.startRow" default="1" type="numeric">
 <!--- Allow for Show All parameter in the URL --->
 <cfparam name="url.showAll" type="boolean" default="No">
 <!--- We know the total number of rows from query --->
 <cfset totalRows = getExp.recordCount>
 <!--- Show all on page if ShowAll passed in URL --->
 <cfif url.showAll>
 <cfset rowsPerPage = totalRows>
 </cfif>
 <!--- Last row is 10 rows past the starting row, or ---> 
<!--- total number of query rows, whichever is less ---> 
<cfset endRow = min(url.startRow + rowsPerPage - 1, totalRows)>

 <!--- Next button goes to 1 past current end row --->
<cfset startRowNext = endRow + 1> 
<!--- Back button goes back N rows from start row --->
 <cfset startRowBack = url.startRow - rowsPerPage>
 <!--- Page Title ---> 
<html> 
<head><title>Expense Browser</title></head> 
<body> 
<cfoutput><h2>#application.companyName# Expense Report</h2></cfoutput>
 <!--- Simple style sheet for formatting --->
 <style>
 TH { font-family:sans-serif;font-size:smaller;
 background:navy;color:white}
 TD { font-family:sans-serif;font-size:smaller}
 TD.DataA { background:silver;color:black}
 TD.DataB { background:lightgrey;color:black}
 </style>
 <table width="600" border="0" cellspacing="0" cellpadding="1">
 <!--- Row at top of table, above column headers --->
 <tr>
 <td width="500" colspan="3">
 <!--- Message about which rows are being displayed --->
 <cfoutput>
 Displaying <b>#url.startRow#</b> to <b>#endRow#</b>
 of <b>#totalRows#</b> Records<br>
 </cfoutput>
 </td>
 <td width="100" align="right">
 <cfif not url.showAll>
 <!--- Provide Next/Back links --->
 <cfinclude template="NextNIncludeBackNext.cfm">

 </cfif>
 </td>
 </tr>
 <!--- Row for column headers --->
 <tr>
 <th width="100">Date</th>


 <th width="250">Film</th>


 <th width="150">Expense</th>


 <th width="100">Amount</th>
 </tr>
 <!--- For each query row that should be shown now --->
 <cfloop query="getExp" startRow="#url.startRow#" endrow="#endRow#">
 <!--- Use class ?DataA" or ?DataB" for alternate rows --->
 <cfset class = getExp.currentRow mod 2 eq 0?"DataA":"DataB">
 <cfoutput>
 <tr valign="baseline">
 <td class="#class#" width="100">#lsDateFormat(expenseDate)#</td>
 <td class="#class#" width="250">#movieTitle#</td> 
<td class="#class#" width="150"><i>#description#</i></td>

 <td class="#class#" width="100">#lsCurrencyFormat(expenseAmount)#</td>
 </tr>
 </cfoutput>
 </cfloop>
 <!--- Row at bottom of table, after rows of data --->
 <tr>
 <td width="500" colspan="3">
 <cfif not url.showAll and totalRows gt rowsPerPage>
 <!--- Shortcut links for ?Pages" of search results --->
 Page <cfinclude template="NextNIncludePageLinks.cfm">
 <!--- Show All link --->
 <cfoutput>
 <a href="#cgi.script_name#?&showAll=Yes">Show All</a>
 </cfoutput>
 </cfif>
 </td>
 <td width="100" align="right">
 <cfif NOT url.showAll>
 <!--- Provide Next/Back links --->
 <cfinclude template="NextNIncludeBackNext.cfm">
 </cfif>
 </td>
 </tr>
 </table>
 </body>
 </html>