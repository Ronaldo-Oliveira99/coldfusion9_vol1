<!--- 
Module:         indexing.cfm
Author:         Leon Chalnick & Ben Forta
Function:       Indexes HTML, Text, Word and Excel 
				content for owshr collection.
Date created:   01/05/2005
--->

Indexing documents ...<br>
<cfflush>
<cfset path = 'http://localhost:8500/ows/35-full_text_searching/docs'>
<!--- Index the owshr collection --->
<cfindex collection="owshr"
         action="refresh"
         type="path"
         key="C:\ColdFusion2023\ows\Docs"
         extensions=".htm, .html, .txt, .doc, .xls"
         recurse="yes"
         urlpath="#path#">
         <!--- urlpath="http://localhost:8500/ows/35-full_text_searching/docs/"> --->

Done!
