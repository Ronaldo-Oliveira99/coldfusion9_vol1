<!--- 
 Filename: EditableHomePage1.cfm
 Author: Nate Weiss (NMW)
 Purpose: Example of altering text with regular expressions
--->

<!--- Enable application variables --->
<cfapplication name="OrangeWhipIntranet">
 
<!--- Declare the HomePage variables and give them initial values ---> 
<cfparam name="APPLICATION.homePage" default="#structNew()#">
<cfparam name="APPLICATION.homePage.messageAsPosted" type="string" default="">
<CFPARAM NAME="APPLICATION.homePage.messageToDisplay" type="string" default="">


<cfdump  var="CGI.script_name_1">
<cfdump  var="#CGI.script_name#">



<!--- If the user is submitting an edited message ---> 
<cfif isDefined("FORM.messageText")>
    <cfdump  var="htmlEditFormat(FORM.messageText)">
    <cfdump  var="#htmlEditFormat(FORM.messageText)#">
   <!---  <cfdump  var="#FORM#">
    <cfdump  var="#FORM.messageText#">
    <cfabort> --->

 <!--- First of all, remove all tags from the posted message --->
 <cfset messageWithoutTags = reReplace(FORM.messageText, 
 "<[^>]*>", <!--- (matches tags) --->
 "", <!--- (replace with empty string) --->
 "ALL")>
 
 <!--- Save the "before" version of the new message ---> 
 <cfset APPLICATION.homePage.messageAsPosted = messageWithoutTags>

 <!--- 
 (other code will be added here in following examples)
 --->
 
 <!--- Save the "after" version of the new message ---> 
 <cfset APPLICATION.homePage.messageToDisplay = messageWithoutTags>
</cfif> 

<!--- This include file takes care of dispaying the actual page --->
<!--- (including the message) or the form for editing the message --->
<cfinclude template="EditableHomePageDisplay.cfm">
