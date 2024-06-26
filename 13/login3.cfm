<!---
Name:        login3.cfm
Author:      Ben Forta (ben@forta.com)
Description: Form field validation demo
Created:     01/01/2010
--->

<html>

<head>
  <title>Orange Whip Studios - Intranet</title>
</head>

<body>

<!--- Page header --->
<cfinclude template='header.cfm'>

<!--- Login form --->
<cfform action='process2.cfm'>

<table align='center' bgcolor='orange'>
  <tr>
    <td align='right'>
      ID:
    </td>
    <td>
      <cfinput type='text'
               name='LoginID'
               maxlength='5'
               required='yes'
               message='A valid numeric ID is required!'
               validate='integer'
               validateAt='onSubmit'>
    </td>
  </tr>
  <tr>
    <td align='right'>
      Password:
    </td>
    <td>
      <cfinput type='password'
               name='LoginPassword'
               maxlength='20'
               required='yes'
               message='Password is required!'
               validateAt='onSubmit'>
    </td>
  </tr>
  <tr>
    <td colspan='2' align='center'>
      <cfinput type='submit'
               name='submit'
               value='Login'>
    </td>
 </tr>
</table>

</cfform>

</body>

</html>
