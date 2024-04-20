<!---
Name:        form5.cfm
Author:      Ben Forta (ben@forta.com)
Description: Introduction to forms
Created:     01/01/2010
--->

<html>

<head>
 <title>Learning ColdFusion Forms 5</title>
</head>

<body>

<!--- Comments form --->
<form action='form5_action.cfm' method='POST'>
Please enter your comments in the box provided, and then click <strong>Send</strong>.
<p>
<textarea name='Comments' rows='10' cols='50'></textarea>
<p>
<input type='submit' value='Send'>

</form>

</body>

</html>
