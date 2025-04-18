<!---
Name:        Report3.cfm
Author:      Ben Forta
Description: Invoke a ColdFusion report
Created:     01/01/2010
--->

<cfparam name='FilmID' default=''>

<cfquery name='Expenses' datasource='ows_oracle'>
SELECT    Films.MovieTitle, Expenses.ExpenseDate,
          Expenses.Description,
          Expenses.ExpenseAmount
FROM      Films, Expenses 
WHERE     Expenses.FilmID = Films.FilmID
<cfif FilmID NEQ ''>
 AND Films.FilmID = #FilmID#
</cfif>
ORDER BY  Films.MovieTitle, expenses.expensedate
</cfquery>

<cfreport template='Expenses.cfr'
          query='Expenses'
          format='PDF' />
