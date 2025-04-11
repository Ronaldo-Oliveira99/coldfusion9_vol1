<!---
Page Name: login.ctm
Description: Authenticate the user and their password. Return successtul logins to original page.
--->
    <cfparam name="URL.originURL" default="#CGI.script_name#?#CGI.query_string#">
    <cfparam name="FORM.username" default="">
    <cfparam name="errMsg" default="">
    
<body>
<html>




    <cfif isDefined("FORM.submit")>
        <cfquery name="qryLogin" datasource="OWS">
            SELECT contacts.FirstName,contacts.LastName, contacts.userRoleID, UserRoles. UserRoleName
            FROM Contacts , UserRoles
            WHERE Contacts.userRoleID = UserRoles.UserRoleID 
            AND Contacts.UserLogin =<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.userName#">
            AND Contacts.UserPassword= <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.UserPassword#">
        </cfquery>


    
        <cfif qryLogin.recordCount EQ 1>
            <cfcookie name="Fullname" value="#qryLogin.FirstName# #qryLogin.LastName#">
            <cfcookie name="userSecurity" value="#qryLogin.UserRoleName#">
            <cflocation url="somepage.cfm">
        <cfelse>
            <cfset errMsg = "Incorrect login information: Please try again">
        </cfif>
    </cfif>

<!--- <cfdump  var="#qryLogin#">
<cfdump  var="#CGI.script_name#">
<cfdump  var="#CGI.query_string#">
<cfabort> --->
    
    <cfoutput>
        <form action="#CGI.script_name#" method="post" name="login">
            <table width="250" cellpadding="3" cellspacing="0" border="1" align="center">
                <tr bgcolor="navy">
                    <td>
                    <font tace="verdana" size="2" color="white">
                    <b>Login</b>
                    </font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <font tace="verdana" size="2" color="000000">#errMsg#</font>
                        <br><b>UserName:</b><br>
                        <input type="text" name="userName" value="<cfoutput>#FORM.userName#</cfoutput>" maxlength="25">
                        <br><b>Password:</b><br>
                        <input type="password" name="userPassword" maxlength="25">
                        <br><br>
                        <input type="submit" name="submit" value="submit">
                        <input type="hidden" name="originURL" value="#URL.originURL#">
                    </td>
                </tr>
            </table>
        </form>
    </cfoutput>

   
</body>
</html>