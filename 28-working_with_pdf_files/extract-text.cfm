<!--- Extract the text from the PDF --->
<cfpdf name="textxml" action="extracttext"
source="samples/cerificado_bussu.pdf" /> 


<cfdump  var="#textxml#"><br><br><br>
<!--- Traverse the text XML and pull the pages ---> 
<cfset xml = XmlSearch(textxml, "/DocText/TextPerPage/Page") />
<cfoutput>
  <!--- Loop over the pages and output the content --->
  <cfloop array="#xml#" index="row">
    <strong>Page #row.xmlattributes.pageNumber#</strong>)
    #row#<br /><br />fdgdfrg
  </cfloop>
</cfoutput>