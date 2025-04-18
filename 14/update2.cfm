<!---
Name:        update2.cfm
Author:      Ben Forta (ben@forta.com)
Description: Table row update demo
Created:     01/01/2010
--->

<!--- Update movie --->
<cfquery datasource='ows_oracle'>
UPDATE Films
SET MovieTitle='#Trim(FORM.MovieTitle)#',
    PitchText='#Trim(FORM.PitchText)#',
    AmountBudgeted=#FORM.AmountBudgeted#,
    RatingID=#FORM.RatingID#,
    Summary='#Trim(FORM.Summary)#',
    ImageName='#Trim(FORM.ImageName)#',
    DateInTheaters=#CreateODBCDate(FORM.DateInTheaters)#
WHERE FilmID=#FORM.FilmID#
</cfquery>

<!--- Page header --->
<cfinclude template='header.cfm'>

<!--- Feedback --->
<cfoutput>
<h1>Movie '#FORM.MovieTitle#' updated</h1>
</cfoutput>

<!--- Page footer --->
<cfinclude template='footer.cfm'>
