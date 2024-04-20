<!---
Name:        form7.cfm
Author:      Ben Forta (ben@forta.com)
Description: Introduction to forms
Created:     01/01/2010
--->

<html>

<head>
 <title>Learning ColdFusion Forms 7</title>
</head>

<body>

<!--- Update/delete form --->
<form action='form7_action.cfm' method='POST'>

<p>

Movie:
<input type='text' name='MovieTitle'>

<p>
<!--- Submit buttons --->
<input type='submit' name='Operation' value='Update'>
<input type='submit' name='Operation' value='Delete'>
<!--- Reset button --->
<input type='reset' value='Clear'>

</form>

</body>

</html>
