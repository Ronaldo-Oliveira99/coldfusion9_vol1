<!---
Name:        Report2.cfm
Author:      Ben Forta
Description: Invoke a ColdFusion report
Created:     01/01/2010
--->

<cfquery name='Expenses' datasource='ows'>
SELECT    Films.MovieTitle, Expenses.ExpenseDate,
          Expenses.Description,
          Expenses.ExpenseAmount
FROM      Films, Expenses 
WHERE     Expenses.FilmID = Films.FilmID
ORDER BY  Films.MovieTitle, expenses.expensedate
</cfquery>

<cfreport template='Expenses.cfr'
          query='Expenses'
          format='PDF' />
