<!--- Optimize the PDF using Nearest_Neighbour algorithm --->
<cfpdf action="optimize" overwrite="yes" algo="Nearest_Neighbour"
source="samples/pdf101.pdf"
destination="pdfs/pdf101_nearest.pdf"/>
<!--- Optimize the PDF using Bicubic algorithm --->
<cfpdf action="optimize" overwrite="yes" algo="Bicubic"
source="samples/pdf101.pdf"
destination="pdfs/pdf101_bicubic.pdf"/>
<!--- Optimize the PDF using Bilinear algorithm --->
<cfpdf action="optimize" overwrite="yes" algo="Bilinear"
source="samples/pdf101.pdf"
destination="pdfs/pdf101_bilinear.pdf"/>