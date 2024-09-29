<!--- Create a PDF portfolio ---> 
<cfpdf action="merge" package="yes" overwrite="yes"
       destination="pdfs/portfolio.pdf">
  <cfpdfparam source="samples/MonthlyTimesheet.doc" />
       <cfpdfparam source="samples/watermark.docx" />
       <cfpdfparam source="samples/Sample.html" />
       <cfpdfparam source="samples/title.pdf" />
       <cfpdfparam source="samples/cerificado_bussu.pdf" />
 </cfpdf>