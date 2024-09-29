 <!--- Extract the text from the PDF --->
 <cfpdf name="textxml" action="extracttext"
       source="samples/cerificado_bussu.pdf" /> 
<!--- Save the text output to a file ---> 
<cffile action="write" file="#ExpandPath('data/cerificado_bussu.xml')#"
        output="#textxml#" />