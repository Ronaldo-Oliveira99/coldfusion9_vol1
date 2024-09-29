<!--- Create a custom in-memory pdf --->
<cfdocument name="cover" format="PDF">
    <h1>Where does it come from?</h1>
    <p>Contrary to popular belief, Lorem Ipsum is not simply random text. 
        It has roots in a piece of classical Latin literature from 45 BC, 
        making it over 2000 years old. Richard McClintock, a Latin professor 
        at Hampden-Sydney College in Virginia, looked up one of the more 
        obscure Latin words, consectetur, from a Lorem Ipsum passage, 
        and going through the cites of the word in classical literature, 
        discovered the undoubtable source. Lorem Ipsum comes from 
        sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" 
        (The Extremes of Good and Evil) by Cicero, written in 45 BC. 
        This book is a treatise on the theory of ethics, very popular 
        during the Renaissance. The first line of Lorem Ipsum, 
        "Lorem ipsum dolor sit amet..", comes from a line in 
        section 1.10.32.</p>
    <h3><cfoutput>#DateFormat(now(),"mm/dd/yyyy")#</cfoutput></h3>
</cfdocument>

<!--- Write the PDF to disk ---> 
<cfpdf action="write" source="cover" overwrite="yes"
    destination="pdfs/loren2.pdf" />

<!--- para deletar p�ginas --->
<!---
<cfpdf  action="deletepages"  overwrite="yes"  source="samples/comps.pdf"
destino="pdfs/comps-page1.pdf"  p�ginas="2-3" />
--->