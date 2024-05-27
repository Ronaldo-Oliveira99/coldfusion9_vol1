<!--- Author: Adam Phillip Churvis -- ProductivityEnhancement.com --->

<cfparam name="Attributes.fieldName" type="string">
<cfparam name="Attributes.size" type="numeric">
<cfparam name="Attributes.maxLength" type="numeric">
<cfparam name="Attributes.label" type="string" default="#Attributes.fieldName#">

<cfif ThisTag.ExecutionMode EQ "Start">
	<cfoutput>
	<tr>
		<td>#Attributes.label#&nbsp;&nbsp;</td>
		<td>
			<input 
				type="text" 
				name="#Attributes.fieldName#" 
				size="#Attributes.size#" 
				maxlength="#Attributes.maxlength#" >
		</td>
	</tr>
	</cfoutput>
</cfif>
