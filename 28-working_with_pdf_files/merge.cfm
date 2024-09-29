<!---  Read the PDF file ---> 
<cfpdf 
    action="merge"  
    overwrite="yes" 
    source="samples/title.pdf, samples/page.pdf"
    destination="pdfs/titlepagemerge.pdf" />
