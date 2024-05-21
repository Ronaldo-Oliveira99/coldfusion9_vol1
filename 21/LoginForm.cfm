<!--- 
 Filename: LoginForm.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Presented whenever a user has not logged in yet
 Please Note Included by Application.cfc
--->

<!--- If the user is now submitting 'Login' form, --->
<!--- Include 'Login Check' code to validate user --->


<!--- 
--->
<!--- <cfdump  var="LoginForm"><br>
<cfdump  var="#isDefined('form.UserLogin')#"><br>
<cfdump  var="#cgi.script_name#"><br>
<cfdump  var="#cgi.query_string#"><br> --->
<!--- <cfabort> --->

<cfif isDefined('form.UserLogin')> 
 <cfinclude template='LoginCheck.cfm'>
</cfif>



<html>
<head>
 <title>Please Log In</title>
</head>

<!--- Place cursor in 'User Name' field when page loads--->
<body onLoad='document.LoginForm.userLogin.focus();'>

<!--- Start our Login Form --->
<cfform action='#cgi.script_name#?#cgi.query_string#' name='LoginForm' method='post'>
 <!--- Use an HTML table for simple formatting --->
 <table border='0'>
 <tr><th colspan='2' bgcolor='silver'>Please Log In</th></tr>
 <tr>
 <th>Username:</th>
 <td>
 
 <!--- Text field for 'User Name' ---> 
 <cfinput 
 type='text'
 name='userLogin'
 size='20'
 value=''
 maxlength='100'
 required='Yes'
 message='Please type your Username first.'>

 </td>
 </tr><tr>
 <th>Password:</th>
 <td>
 
 <!--- Text field for Password ---> 
 <cfinput 
 type='password'
 name='userPassword'
 size='12'
 value=''
 maxlength='100'
 required='Yes'
 message='Please type your Password first.'>

 <!--- Submit Button that reads 'Enter' ---> 
 <input type='Submit' value='Enter'>
 
 </td>
 </tr>
 </table>
 
</cfform>

</body>
</html>
