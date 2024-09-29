<!--- Protects the pdf with an owner password ---> 
<!---  <cfpdf action="protect" source="samples/comps.pdf" overwrite="yes"
 destination="pdfs/comps-protected-owner.pdf"
 newownerpassword="test" permissions="none" /> --->


<!--- Adds owner password and sets permissions ---> 
<cfpdf action="protect" overwrite="yes" source="samples/comps.pdf"
destination="pdfs/comps-ownerpassword-permissions.pdf"
newownerpassword="test" permissions="allowdegradedprinting,allowmodifycontents, allowscreenreaders" />
