<!---
Name:          merchandisesearch_action3.cfm
Author:        Leon Chalnick & Ben Forta
Description:   Takes criteria from and
               searches against Merchandise
               Description field in db.
Date created:  01/05/2005
--->

<!--- Perform a Verity search --->
<cfsearch collection="merchandise"
          name="GetResults"
          criteria="#FORM.Criteria#">

          <cfdump  var="#GetResults#">

<!--- Display the query results --->
<html>
<head>
 <title>Search Results</title>
</head>

<body>
<cfoutput>
<h2>
#GetResults.RecordCount# Merchandise record(s) found for 
"#FORM.Criteria#".
</h2>
</cfoutput>



<!--- Use definition list to disply Verity output 
 score, title and summary from each item found. --->
<dl>
<cfoutput query="GetResults">
    <strong>#Title#</strong>
    <dt><emp>Score:#NumberFormat(Score)#</emp>
    <!--- <dt><emp>#NumberFormat(Round(Score * 100))#%</emp> --->
    <dd><small>#Summary#</small></dd>
</cfoutput>
</dl>

</body>
</html>

