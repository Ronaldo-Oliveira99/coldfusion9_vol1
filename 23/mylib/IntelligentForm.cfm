<!--- Author: Adam Phillip Churvis -- ProductivityEnhancement.com --->

<cfparam name="Attributes.formName" type="string" default="formName">
 
<cfoutput>
<cfif ThisTag.ExecutionMode EQ "Start">
	<table cellspacing="0" cellpadding="0" border="0">
	<form name="#Attributes.formName#" method="Post">
<cfelse>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" value="Submit Form"></td>
	</tr>
	</form>
	</table>
</cfif>
</cfoutput>
