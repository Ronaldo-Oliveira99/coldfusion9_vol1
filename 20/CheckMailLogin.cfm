<!--- 
 Filename: CheckMailLogin.cfm
 Author: Nate Weiss (NMW)
 Purpose: Provides a login form for the simple POP client
--->

<!--- If user is submitting username/password form --->
<cfif isDefined('form.popServer')>
 <!--- Retain username, password, server in session --->
 <cfset session.mail = structNew()>
 <cfset session.mail.popServer = form.popServer>
 <cfset session.mail.username = form.username>
 <cfset session.mail.password = form.password>
 <!--- Remember server and username for next time ---> 
 <cfset client.mailServer = form.popServer>
 <cfset client.mailUsername = form.username>

<cfelse> 

 <!--- Use server/username from last time, if available --->
 <cfparam name='client.mailServer' type='string' default=''>
 <cfparam name='client.mailUsername' type='string' default=''>
 
 <!--- Simple form for user to provide mailbox info --->
 <cfform action='#cgi.script_name#' method='post'>
 <p>To access your mail, please provide the 
 server, username and password.<br>
 
 <!--- form field: POPServer --->
 <p>Mail Server:<br>
 <cfinput type='text' name='popServer' 
 value='#client.mailServer#' required='Yes' 
 message='Please provide your mail server.'> 
 (example: pop.yourcompany.com)<br>
 
 <!--- form field: Username ---> 
 Mailbox Username:<br>
 <cfinput type='text' name='username'
 value='#client.mailUsername#' required='Yes'
 message='Please provide your username.'> 
 (yourname@yourcompany.com)<br>
 
 <!--- form field: Password ---> 
 Mailbox Password:<BR>
 <cfinput type='password' name='password'
 required='yes' 
 message='Please provide your password.'><br>
 
 <cfinput type='submit' name='submit' value='Check Mail'><br>
 </cfform>
 
 </body></html>
 <cfabort>
</cfif>
