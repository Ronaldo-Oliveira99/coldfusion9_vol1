 <!--- Create the thumbnails ---> 
 <cfpdf action="extractimage" source="samples/comps.pdf"
 destination="images/pdfimages" overwrite="yes" />
<!--- Read the thumbnails directory ---> 
<cfdirectory name="thumbs" directory="#ExpandPath('images/thumbs')#" />


<cfdump  var="#thumbs#">
<!--- Output the images to the browser ---> 
<cfoutput query="thumbs"> 
    #currentRow#) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# name#<br />
    <img src="images/thumbs/#name#" align="top" /> 
    <br /> 
    <hr /> 
</cfoutput>