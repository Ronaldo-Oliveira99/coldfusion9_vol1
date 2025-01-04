<!---
Name:        insert2.cfm
Author:      Ben Forta (ben@forta.com)
Description: Table row insertion demo
Created:     01/01/2010
--->

<!--- Insert movie --->
<cfquery datasource='ows_oracle'>
INSERT INTO Films(MovieTitle,
                  PitchText,
                  AmountBudgeted,
                  RatingID,
                  Summary,
                  ImageName,
                  DateInTheaters)
VALUES('#Trim(FORM.MovieTitle)#',
       '#Trim(FORM.PitchText)#',
       #FORM.AmountBudgeted#,
       #FORM.RatingID#,
       '#Trim(FORM.Summary)#',
       '#Trim(FORM.ImageName)#',
       #CreateODBCDate(FORM.DateInTheaters)#)
</cfquery>

<!--- Page header --->
<cfinclude template='header.cfm'>

<!--- Feedback --->
<cfoutput>
<h1>New movie '#FORM.MovieTitle#' added</h1>
</cfoutput>

<!--- Page footer --->
<cfinclude template='footer.cfm'>
