<!--- 
 Filename: EditableHomePage3.cfm
 Author: Nate Weiss (NMW)
 Purpose: Example of altering text with regular expressions
--->

<!--- Enable application variables --->
<cfapplication name="OrangeWhipIntranet">
 
<!--- Declare the HomePage variables and give them initial values ---> 
<cfparam name="APPLICATION.homePage" default="#structNew()#">
<cfparam name="APPLICATION.homePage.messageAsPosted" type="string" default="">
<cfparam name="APPLICATION.homePage.messageToDisplay" type="string" default="">

<!--- If the user is submitting an edited message ---> 
<cfif isDefined("FORM.messageText")>

 <!--- First of all, remove all tags from the posted message --->
 <cfset FORM.messageText = reReplace(FORM.messageText, 
 "<[^>]*>", <!--- (matches tags) --->
 "", <!--- (replace with empty string) --->
 "ALL")>
 
 <!--- Save the "before" version of the new message ---> 
 <cfset APPLICATION.homePage.messageAsPosted = FORM.messageText>

 <!--- Find all email addresses --->
 <cfset matches = reMatchNoCase("([\w._]+)@([\w_]+(\.[\w_]+)+)",
   FORM.messageText)>

 <!--- loop through results --->
 <cfloop index="match" array="#matches#">
 
     <!--- Try to find email address in the database --->
     <cfquery name="emailQuery" datasource="ows">
     SELECT FirstName, LastName
     FROM Contacts
     WHERE EMail = '#match#'
     </cfquery>
     
     <!--- If the email address was found in the database --->
     <cfif emailQuery.recordCount eq 1>
       <cfset linkText = '<a href="mailto:#match#">' 
       & "#emailQuery.FirstName# #emailQuery.LastName#</a>">
     
     <!--- If it was not found ---> 
     <cfelse>

       <cfset linkText = 
       '<a href="mailto:#match#">#match#</a>'>
    
     </cfif>
     
	<!--- Replace the email --->
     <cfset FORM.messageText = replaceNoCase(form.messageText,
	match, linkText)>
     
 </cfloop> 
 
 <!--- Save the "after" version of the new message ---> 
 <cfset APPLICATION.homePage.messageToDisplay = FORM.messageText>

</cfif> 

<!--- This include file takes care of dispaying the actual page --->
<!--- (including the message) or the form for editing the message --->
<cfinclude template="EditableHomePageDisplay.cfm">
