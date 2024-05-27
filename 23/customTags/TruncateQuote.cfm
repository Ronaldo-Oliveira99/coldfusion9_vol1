<!--- Author: Adam Phillip Churvis -- ProductivityEnhancement.com --->
<!--- Truncates and formats a body of text | Truncatequote.cfm --->

<cfparam name="Attributes.numberOfCharacters" type="numeric" default="300">

<cfif ThisTag.ExecutionMode EQ "Start">
  <div style="border: 1px solid Black; width:300px;">
<cfelse>
  ...
  </div>
  
  <cfset ThisTag.GeneratedContent = Left(ThisTag.GeneratedContent, 
    Attributes.numberOfCharacters)>
</cfif>

<!--- <cfdump  var="#ThisTag#"> --->
