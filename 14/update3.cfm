<!---
Name:        update3.cfm
Author:      Ben Forta (ben@forta.com)
Description: Table row update demo
Created:     01/01/2010
--->

<!--- Update movie --->
<cfupdate datasource='ows_oracle'
          tablename='FILMS'>

<!--- Page header --->
<cfinclude template='header.cfm'>

<!--- Feedback --->
<cfoutput>
<h1>Movie '#FORM.MovieTitle#' updated</h1>
</cfoutput>

<!--- Page footer --->
<cfinclude template='footer.cfm'>
