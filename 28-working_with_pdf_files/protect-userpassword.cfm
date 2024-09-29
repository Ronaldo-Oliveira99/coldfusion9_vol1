<!--- Protects the pdf with a user password --->
<cfpdf action="protect" source="samples/comps.pdf"
destination="pdfs/comps-protected-user.pdf"
newuserpassword="test" overwrite="yes" />