<!---
Name:        insert4.cfm
Author:      Ben Forta (ben@forta.com)
Description: Table row insertion demo
Created:     01/01/2010
--->
<!--- <cfdump  var="#form#">
<cfabort> --->

<!--- Insert movie --->
<cfinsert datasource='ows_oracle'
          tablename='FILMS'>

<!--- Page header --->
<cfinclude template='header.cfm'>

<!--- Feedback --->
<cfoutput>
<h1>New movie '#FORM.MovieTitle#' added</h1>
</cfoutput>

<!--- Page footer --->
<cfinclude template='footer.cfm'>
