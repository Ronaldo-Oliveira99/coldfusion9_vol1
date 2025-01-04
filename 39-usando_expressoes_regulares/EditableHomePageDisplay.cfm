<!--- 
 Filename: EditableHomePageDisplay.cfm
 Author: Nate Weiss (NMW)
 Please Note Included by the EditableHomePage.cfm examples
--->


<html>
<head><title>Orange Whip Studios Home Page</title></head>
<body>
<cfoutput>
 <!--- Orange Whip Studios logo and page title --->
 <img src="../images/logo_c.gif" width="101" height="101" alt="" align="absmiddle">
 <b>Orange Whip Studio Home Page</b><br clear="all">

 <!--- Assuming that the user is not trying to edit the page --->

 <cfdump  var="CGI.script_name_2">
 <cfdump  var="#CGI.script_name#">


 <cfif not isDefined("URL.edit")>

   <!--- Display the home page message --->
   <p>#paragraphFormat(APPLICATION.homePage.messageToDisplay)#
   
   <!--- Provide a link to edit the message --->
   <p>[<a href="#CGI.script_name#?edit=Yes">edit message</a>]</p>

 <!--- If the user wants to edit the page --->
 <cfelse>

   <!--- Simple form to edit the home page message --->
   <form action="#CGI.script_name#" method="post">
  
   <!--- Text area for typing the new message --->
   <textarea
   name="messageText"
   cols="60"
   rows="10">#htmlEditFormat(APPLICATION.homePage.messageAsPosted)#</textarea><br>
   


   <!--- Submit button to save the message --->
   <input
   type="submit"
   value="Save Text"> 
   </form>
 
 </cfif>
</cfoutput> 

</body>
</html>
