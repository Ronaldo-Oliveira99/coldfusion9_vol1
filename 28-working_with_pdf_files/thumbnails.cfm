 <!--- Create the thumbnails ---> 
 <cfpdf action="thumbnail" overwrite="yes" imageprefix="v1"
    source="samples/comps.pdf" destination="images/thumbs" />
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