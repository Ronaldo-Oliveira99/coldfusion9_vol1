<!---  Read the PDF file ---> 

<!--- 
    Alternativamente,  podemos  usar  tags  cfpdfparam 
    dentro  da  tag  cfpdf  para  especificar  os  arquivos  de  origem,  
    conforme  mostrado :
--->
<cfpdf 
action="merge"  
overwrite="yes" 
destination="pdfs/titlepagemerge2.pdf">

    <cfpdfparam source="samples/title.pdf" />
    <cfpdfparam source="samples/page.pdf" />

</cfpdf>