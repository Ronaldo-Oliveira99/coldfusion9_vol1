<!---
Name:        search1.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Dynamic search example
--->

<form>
Search: <input type="text" name="search">
<input type="button" value="Search">
</form>

<cfdiv bind="url:movieresults.cfm?search={search}" />
<!--- ou --->
<!--- 
    evento ao digitar o bot�o (search2.cfm)
    <cfdiv bind="url:movieresults.cfm?search={search@keypress}" /> 
--->