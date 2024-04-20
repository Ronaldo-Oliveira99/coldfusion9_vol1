<!--- 
 Filename: LoginCheck.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Validates a user's password entries
 Please Note Included by LoginForm.cfm
--->

<!--- Make sure we have Login name and Password --->
<cfparam name='form.userLogin' type='string'>
<cfparam name='form.userPassword' type='string'>

<!--- Find record with this Username/Password --->
<!--- If no rows returned, password not valid --->
<cfquery name='getUser'>
 SELECT ContactID, FirstName
 FROM Contacts
 WHERE UserLogin = 
 <cfqueryparam cfsqltype='cf_sql_varchar' value='#form.UserLogin#'>
 AND UserPassword = 
 <cfqueryparam cfsqltype='cf_sql_varchar' value='#form.UserPassword#'>
</cfquery>

<!--- If the username and password are correct --->
<cfif getUser.recordCount eq 1>
 <!--- Remember user's logged-in status, plus --->
 <!--- ContactID and First Name, in structure --->
 <cfset SESSION.auth = structNew()>
 <cfset SESSION.auth.isLoggedIn = 'Yes'>
 <cfset SESSION.auth.contactID = getUser.contactID>
 <cfset SESSION.auth.firstName = getUser.firstName>

 <!--- Now that user is logged in, send them --->
 <!--- to whatever page makes sense to start --->
 <cflocation url='#cgi.script_name#?#cgi.query_string#'>
</cfif>
