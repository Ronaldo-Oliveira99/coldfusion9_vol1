<!--- 
Module:         create.cfm
Author:         Leon Chalnick & Ben Forta
Function:       Create a new collection.
Date created:   01/05/2005
--->

<html>
<head>
 <title>Creating Verity Collection</title>
</head>
<body>


<!--- feedback --->
Creating collection ...<br>
<cfflush>

<cfdump  var="#server.coldfusion.rootdir#">
<cfabort>

<!--- Create the new verity collection --->
<cfcollection action="create"
              collection="finance"
              engine="solr"
              path="#server.coldfusion.rootdir#/collections/finance">

<!--- feedback --->
Done!
<cfflush>

</body>
</html>
