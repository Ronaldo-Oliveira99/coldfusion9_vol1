<!---
Name:        login2.cfm
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
               validateAt='onServer'
               >
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
               required='no'
               message='Password is required!'
               validateAt='onServer'>
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



<br>
<br>
<br>
<br>
<br>


<tr>
  <td align='right'>
    Red:
  </td>
  <td align='center'>

    <cfinput type='text'
       name='color_r'
       validate='regex'
       pattern='[A-Fa-f0-9]{ 2,}'
       message='RGB value must be 00-FF'
       size='2'
       maxlength='2'>
  </td>
  <td align='right'>
    Red:
  </td>
  <td align='center'>

    <cfinput type='text'
       name='color_g'
       validate='regex'
       pattern='[A-Fa-f0-9]{ 2,}'
       message='RGB value must be 00-FF'
       size='2'
       maxlength='2'>
  </td>
  <td align='right'>
    Green:
  </td>
  <td align='center'>

    <cfinput type='text'
       name='color_b'
       validate='regex'
       pattern='[A-Fa-f0-9]{ 2,}'
       message='RGB value must be 00-FF'
       size='2'
       maxlength='2'>

  </td>

</tr>

</cfform>

</body>

</html>
