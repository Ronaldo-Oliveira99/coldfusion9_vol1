<!--- 
 Filename: CheckMailMsg.cfm
 Author: Nate Weiss (NMW)
 Purpose: Allows the user to view a message on their POP server
--->

<html>
<head><title>Mail Message</title></head>
<body>

<!--- Simple CSS-based formatting styles --->
<style>
 body { font-family:sans-serif;font-size:12px} 
 th { font-size:12px;background:navy;color:white} 
 td { font-size:12px;background:lightgrey;color:navy} 
</style>

<h2>Mail Message</h2>

<!--- A message uid must be passed in the url --->
<cfparam name='url.uid'>
<cfparam name='url.delete' type='boolean' default='No'>

<!--- If we donÕt have a username/password --->
<!--- send user to main CheckMail.cfm page --->
<cfif not isDefined('session.mail.getMessages')>
 <cflocation url='CheckMail.cfm'>
</cfif>

<!--- find our position in the query --->
<cfset position = listFindNoCase(valueList(session.mail.getMessages.uid), url.uid)>

<!--- If the user is trying to delete the message --->
<cfif url.delete>
 <!--- Contact POP Server and delete the message --->
 <cfpop action='Delete' uid='#url.uid#'
 server='#session.mail.popServer#'
 username='#session.mail.username#'
 password='#session.mail.password#'>

 <!--- Send user back to main 'Check Mail' page ---> 
 <cflocation url='CheckMail.cfm?refresh=Yes' addToken='false'>


<!--- If not deleting, retrieve and show the message --->
<cfelse>
 <!--- Contact POP Server and retrieve the message --->
 <cfpop action='GetAll' name='GetMsg'
 uid='#url.uid#'
 server='#session.mail.popServer#'
 username='#session.mail.username#'
 password='#session.mail.password#'>
 
 <cfset msgDate = parseDateTime(getMsg.Date, 'pop')> 
 
 <!--- If message was not retrieved from POP server ---> 
 <cfif getMsg.recordCount neq 1>
 <cfthrow message='Message could not be retrieved.'
 detail='Perhaps the message has already been deleted.'>
 </cfif> 
 
 <!--- We will provide a link to Delete message --->
 <cfset deleteurl = '#cgi.script_name#?uid=#uid#&delete=Yes'>
 
 <!--- Display message in a simple table format ---> 
 <table border='0' cellSpacing='0' cellPadding='3'>
 <cfoutput>
 <tr>
 <th bgcolor='wheat' align='left' nowrap>
 Message #position# of #session.mail.getMessages.recordCount#
 </th>
 <td align='right' bgcolor='beige'>
 <!--- Provide 'Back' button, if appropriate ---> 
 <cfif position gt 1>
 <cfset prevuid = session.mail.getMessages.uid[decrementValue(position)]>
 <a href='CheckMailMsg.cfm?uid=#prevuid#'>
 <img src='../images/browseback.gif' 
 width='40' height='16' alt='Back' border='0'></a>
 </cfif>
 <!--- Provide 'Next' button, if appropriate --->
 <cfif position lt session.mail.getMessages.recordCount>
 <cfset nextuid = session.mail.getMessages.uid[incrementValue(position)]>
 <a href='CheckMailMsg.cfm?uid=#nextuid#'>
 <img src='../images/browsenext.gif' 
 width='40' height='16' alt='Next' border='0'></a>
 </cfif>
 </td>
 </tr>
 <tr>
 <th align='right'>From:</th>
 <td>#htmlEditFormat(getMsg.From)#</td>
 </tr>
 <cfif getMsg.CC neq ''>
 <tr>
 <th align='right'>CC:</th>
 <td>#htmlEditFormat(getMsg.CC)#</td>
 </tr>
 </cfif>
 <tr>
 <th align='right'>Date:</th>
 <td>#dateFormat(msgDate)# #timeFormat(msgDate)#</td>
 </tr>
 <tr>
 <th align='right'>Subject:</th>
 <td>#getMsg.Subject#</td>
 </tr>
 <tr>
 <td bgcolor='beige' colspan='2'>
 <strong>Message:</strong><br>
 <cfif len(getMsg.htmlBody)>
 #getMsg.htmlBody# 
 <cfelse>
 #htmlCodeFormat(getMsg.textBody)#
 </cfif>
  </td>
 </tr>
 </cfoutput>
 </table> 

 <cfoutput> 
 <!--- Provide link back to list of messages --->
 <strong><a href='CheckMail.cfm'>Back To Message List</a></strong><br>
 <!--- Provide link to Delete message --->
 <a href='#deleteurl#'>Delete Message</a><br>
 <!--- 'Log Out' link to discard session.Mail info --->
 <a href='CheckMail.cfm?Logout=Yes'>Log Out</a><br>
 </cfoutput>
</cfif>

</body>
</html>
