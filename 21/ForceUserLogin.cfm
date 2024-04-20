<!--- 
 Filename: ForceUserLogin.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Requires each user to log in
 Please Note Included by Application.cfc
--->
 
 
<!--- Force the user to log in --->
<!--- *** This code only executes if the user has not logged in yet! *** --->
<!--- Once the user is logged in via <cfloginuser>, this code is skipped --->
<cflogin>
 
 <!--- If the user hasn't gotten the login form yet, display it ---> 
 <cfif not (isDefined('form.userLogin') and isDefined('form.userPassword'))>
    <cfinclude template='UserLoginForm.cfm'>
    <cfabort> 
 
 <!--- Otherwise, the user is submitting the login form ---> 
 <!--- This code decides whether the username and password are valid --->
 <cfelse> 
 
   <!--- Find record with this Username/Password --->
   <!--- If no rows returned, password not valid --->

   <cfquery name='getUser'>
   SELECT ContactID, FirstName, rTrim(UserRoleName) as UserRoleName
   FROM Contacts LEFT OUTER JOIN UserRoles
   ON Contacts.UserRoleID = UserRoles.UserRoleID
   WHERE UserLogin = 
	<cfqueryparam cfsqltype='cf_sql_varchar' value='#form.UserLogin#'>
   AND UserPassword = 
	<cfqueryparam cfsqltype='cf_sql_varchar' value='#form.UserPassword#'>
   </cfquery>
 
   <!--- If the username and password are correct... --->
   <cfif getUser.recordCount eq 1>
     <!--- Tell ColdFusion to consider the user 'logged in' --->
     <!--- For the NAME attribute, we will provide the user's --->
     <!--- ContactID number and first name, separated by commas --->
     <!--- Later, we can access the NAME value via GetAuthUser() --->
     <cfloginuser
     name='#getUser.ContactID#,#getUser.FirstName#'
     password='#form.userPassword#'
     roles='#getUser.userRoleName#'> 
   
   <!--- Otherwise, re-prompt for a valid username and password --->
   <cfelse> 
     Sorry, that username and password are not recognized.
     Please try again.
     <cfinclude template='UserLoginForm.cfm'>
     <cfabort>
   </cfif>
 
 
 </cfif> 

</cflogin>
