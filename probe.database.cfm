<cftry>
    <cfquery name="probeDB" datasource="OWS" >
        SELECT * FROM CONTACTS
        WHERE CONTACTS.FIRSTNAME = 'Ben'
    </cfquery>

    <!--- <cfdump  var="probeDB">
    <cfdump  var="#probeDB#"> --->


<cfcatch type="database">
    Error !
</cfcatch>
    Success
</cftry>

