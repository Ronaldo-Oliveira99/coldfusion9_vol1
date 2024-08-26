<cfset tempDir = GetTempDirectory()>
<cfdump  var="#tempDir#"><br>
<!--- 
<cfset nome = "João">
<cfset data = Now()>

<cfdocument format="pdf" filename="tempPDF.pdf">
    <h1>Relatório de Usuário</h1>
    <p>Nome: #nome#</p>
    <p>Data: #DateFormat(data, "dd/mm/yyyy")#</p>
</cfdocument> 
--->

<cfset pdfPath = "pdf/fatura-Julho.pdf">
<cfset pdf_path=ExpandPath(pdfPath)> 

<cfoutput>#pdf_path#</cfoutput>
<br>

<cfif FileExists(pdf_path)>
    <cfoutput>O arquivo existe.</cfoutput>
<cfelse>
    <cfoutput>O arquivo não existe.</cfoutput>
</cfif>
<br>
<cfset pdfBinary = FileReadBinary(pdf_path)>


---------------------------------<br>

<cfpdf 
    action="write" 
    source="#pdfBinary#" 
    overwrite = "yes" 
    destination="pdf/meupdf2.pdf"
>



<cfset tempDir = GetTempDirectory()>
<cfset tempFile = tempDir & "tempPDF2.pdf">
<cfset tempFile3 = "pdf/meupdf.pdf">
<cfset tempFile2 = "C:/ColdFusion2023/cfusion/runtime/work/Catalina/localhost/tmp/tempPDF2.pdf" >


<cfdump  var="#tempFile#"><br>


<cfif FileExists(tempFile)>
    <cfoutput>O arquivo existe na pasta temp.</cfoutput>
    <br>
<!---     <iframe src="<cfoutput>#tempFile3#</cfoutput>" width="900px" height="800px"></iframe>
 --->
    <embed 
    <!--- src="<cfoutput>#tempFile#</cfoutput>" ---> 
    src="<cfoutput>#tempFile3#</cfoutput>" 
    width="900px" 
    height="2100px" 
        type="application/pdf">

       <!---  <object width="400px" height="500px" type="application/pdf" data="<cfoutput>#tempFile2#</cfoutput>">
            <p>Insert your error message here, if the PDF cannot be displayed.</p>
        </object> --->
<cfelse>
    <cfoutput>O arquivo não existe na pasta temp.</cfoutput>
</cfif>



<!--- <cfoutput>
    PDF criado em: #tempFile#
</cfoutput>
 --->

<!--- <cfoutput>
    <iframe src="#tempFile#" width="600" height="500"></iframe>
</cfoutput> --->