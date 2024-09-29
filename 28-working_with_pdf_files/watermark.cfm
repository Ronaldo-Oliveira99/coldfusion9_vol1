 <!--- Adds a watermark using an image ---> 
 <!--- <cfpdf action="addwatermark" overwrite="yes" foreground="yes"
 destination="pdfs/comps-image-watermark.pdf"
 source="samples/comps.pdf" image="samples/watermark.png" /> --->


  <!--- Adds a watermark using a pdf ---> 
<!--- <cfpdf action="addwatermark" source="samples/comps.pdf"
destination="pdfs/comps-pdf-watermark2.pdf"
copyFrom="samples/watermark.pdf" overwrite="yes" opacity="3"
foreground="yes" rotation="45" position="375,-275" /> --->



 <!-- Removes watermark -->
 <cfpdf action="removewatermark"
       source="pdfs/comps-image-watermark.pdf"
       destination="pdfs/comps-image-watermark-removed.pdf" />