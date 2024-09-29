<!--- Optimize the PDF using lossy optimization --->
<cfpdf action="optimize" overwrite="yes"
nofonts="true" nometadata="true" nolinks="true"
noattachments="true" nobookmarks="true" nocomments="true"
               nojavascripts="true" nothumbnails="true"
source="samples/cerificado_bussu.pdf" destination="pdfs/cerificado_bussu2.pdf"/>

<!--- Encode all non-encoded streams ---> 
<cfpdf action="write" overwrite="yes" encodeall="true"
       saveoption="linear"
       source="samples/cerificado_bussu.pdf" destination="pdfs/cerificado_bussu3.pdf"/>