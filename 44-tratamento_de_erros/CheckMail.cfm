<!---
 Filename: CheckMail.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Uses exception handling while retrieving email with <CFPOP>
--->

<!--- Include UDF function library, which includes the --->
<!--- TryToParsePOPDateTime() function used near the end of this page --->
<cfinclude template="POPDateFunctions.cfm">

<html>
<head><title>Check Your Mail</title></head>
<body>

<!--- Simple CSS-based formatting styles --->
<style>
 BODY { font-family:sans-serif;font-size:12px} 
 TH { font-size:12px;background:navy;color:white} 
 TD { font-size:12px;background:lightgrey;color:navy} 
</style>
<h2>Check Your Mail</h2>

<!--- If user is logging out, ---> 
<!--- or if user is submitting a different username/password --->
<cfif isDefined("URL.logout") or isDefined("FORM.popServer")>
  <cfset structDelete(SESSION, "mail")>
</cfif>

<!--- If we don’t have a username/password --->
<cfif not isDefined("SESSION.mail")>
  <!--- Show "mail server login" form --->
  <cfinclude template="CheckMailLogin.cfm">
</cfif>


<!--- If we need to contact server for list of messages --->
<!--- (if just logged in, or if clicked "Refresh" link) --->
<cfif not isDefined("SESSION.mail.getMessages") or isDefined("URL.refresh")>

  <!--- Attempt to contact mail server --->
  <!--- If attempt is unsuccessful, try to catch the most common errors --->
  <cftry> 
  
  <!--- Contact POP Server and retrieve messages --->
  <cfpop action="GetHeaderOnly" name="SESSION.mail.getMessages"
  server="#SESSION.mail.popServer#" username="#SESSION.mail.username#"
  password="#SESSION.mail.password#" maxrows="50">
 
  <!--- If an error occurs... --->
  <cfcatch type="APPLICATION">
    <!--- If the problem seems to be related to javax.mail, then --->
    <!--- examine the message further and try to deal with the problem --->
    <cfif CFCATCH.detail contains "javax.mail">
    
      <!--- If the username/password were rejected by mail server ---> 
      <cfif CFCATCH.detail contains "javax.mail.AuthenticationFailedException">
        <!--- Explain what happened --->
        <cfoutput>
        <p><b>The username and password you provided were not accepted by
        your mail server. Keep in mind that the username and password may be 
        case-sensitive, so make sure you are getting the capitalization 
        exactly right.</b></p>
        </cfoutput>
 
      <!--- If the mail server cannot be found or can’t be connected to ---> 
      <cfelseif CFCATCH.Detail contains "java.net.UnknownHostException">
        <!--- Explain what happened --->
        <cfoutput>
        <p><b>The mail server you specified (#SESSION.mail.popServer#) does
        not appear to be working. Please check the name and try again.</b></p>
        </cfoutput> 
        
      <!--- If some error occurs... ---> 
      <cfelse>
        <!--- Display a generic error message --->
        <cfoutput>
        <p><b>We’re sorry, we weren’t able to retrieve your messages at 
        this time. The problem may be with your mail server, 
        or some other network issue.</b></p>
        </cfoutput>

        <!--- Create a message to store in the log --->
        <cfset logMsg = "Couldn’t get mail from #SESSION.mail.popServer#."
        & "Message: #CFCATCH.Message# Detail: #CFCATCH.Detail#">
 
        <!--- Log the problem. --->
        <!--- Appends to CheckMailErrorLog.log in CFusionMX/Logs folder --->
        <cflog file="CheckMailErrorLog" text="#logMsg#">

      </cfif>
 
      <!--- Discard login information from SESSION scope --->
      <!--- This will force user to re-provide credentials --->
      <cfset structDelete(SESSION, "mail")>
 
      <!--- Show "mail server login" form again --->
      <cfset structDelete(FORM, "popServer")>
      <cfinclude template="CheckMailLogin.cfm">
 
      <!--- Stop processing at this point ---> 
      <cfabort>
 
    <!--- If the problem does not seem to be related to javax.mail, ---> 
    <!--- then just rethrow the error and let it expose itself normally. --->
    <cfelse>
      <cfrethrow> 
    </cfif>
 </cfcatch> 

 </cftry>
</cfif> 

 
<!--- If no messages were retrieved... --->
<cfif SESSION.mail.getMessages.recordCount eq 0>
  <p>You have no mail messages at this time.<br>
 
<!--- If messages were retrieved... ---> 
<cfelse>
  <!--- Display Messages in HTML Table Format ---> 
  <table border="0" cellPadding="2" cellspacing="2" cols="3" width="550">
  <!--- Column Headings for Table --->
  <tr>
  <th width="100">Date Sent</th>
  <th width="200">From</th>
  <th width="200">Subject</th>
  </tr>

  <!--- Display info about each message in a table row --->
  <cfoutput query="SESSION.mail.getMessages">
    <!--- Let user click on Subject to read full message --->
    <cfset linkURL = "CheckMailMsg2.cfm?msgNum=#MessageNumber#">
    
    <tr valign="baseline">
    <!--- Show parsed and formatted Date and Time for message--->
    <!--- If it can’t be parsed, it will just be displayed as is --->
    <td>
    #tryToFormatPOPDateTime(SESSION.mail.getMessages.Date)#
    </td>
    <!--- Show "From" address, escaping brackets --->
    <td>#htmlEditFormat(From)#</td>
    <td><strong><a href="#linkURL#">#Subject#</a></strong></td>
    </tr> 
  </cfoutput>
  </table>
 
  <!--- "Refresh" link to get new list of messages --->
  <b><a href="CheckMail.cfm?refresh=Yes">Refresh Message List</a></b><br>
  <!--- "Log Out" link to discard SESSION.Mail info --->
  <A HREF="CheckMail.cfm?Logout=Yes">Log Out</A><BR>
</cfif>

</body>
</html>
