<!---
Name:        ChartData.cfc
Author:      Ben Forta
Description: Chart data component
Created:     01/01/2010
--->

<cfcomponent>


<!--- Get budget data for all movies --->
<cffunction name='GetBudgetData' returntype='query' output='no'>
 <cfargument name='maxrows' type='numeric' default='-1'>
 <cfquery name='budget'
          datasource='ows_oracle'
          maxrows='#maxrows#'>
  SELECT FilmID, MovieTitle, AmountBudgeted
  FROM Films
  ORDER BY MovieTitle
 </cfquery>
 <cfreturn budget>

</cffunction>


<!--- Get budget and expense data for all movies --->
<cffunction name='GetExpenses' returntype='query' output='no'>
 <cfargument name='maxrows' type='numeric' default='-1'>
 <cfquery name='expenses'
          datasource='ows_oracle'
          maxrows='#maxrows#'>
  SELECT FilmID, MovieTitle, AmountBudgeted,
        (SELECT SUM(ExpenseAmount)
         FROM Expenses
         WHERE FilmID = Films.FilmID) AS ExpenseTotal
  FROM Films
  ORDER BY MovieTitle
 </cfquery>
 <cfreturn expenses>

</cffunction>


<!--- Get file id --->
<cffunction name='GetFilmID' returntype='numeric' output='no'>
 <cfargument name='MovieTitle' type='string' required='yes'>
 <cfset var result=-1>
 <cfquery name='movie' datasource='ows_oracle'>
  SELECT FilmID
  FROM Films
  WHERE MovieTitle = '#ARGUMENTS.MovieTitle#'
 </cfquery>
 <cfif movie.RecordCount IS 1>
  <cfset result=movie.FilmID>
 </cfif>
 <cfreturn result>

</cffunction>


<!--- Get movie details --->
<cffunction name='GetExpenseDetails' returntype='query' output='no'>
 <cfargument name='FilmID' type='numeric' required='yes'>
 <cfquery name='expenses'
          datasource='ows_oracle'>
  SELECT * FROM Expenses
  WHERE FilmID = #ARGUMENTS.FilmID#
  ORDER BY ExpenseDate
 </cfquery>
 <cfreturn expenses>

</cffunction>


</cfcomponent>
