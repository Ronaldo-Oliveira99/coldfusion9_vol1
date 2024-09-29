<!---  Read the PDF file ---> 
<cfpdf name="doc" action="read" source="pdfs/create-meta.pdf" />
<!--- Dump PDF contents ---> 
<cfdump var="#doc#" />