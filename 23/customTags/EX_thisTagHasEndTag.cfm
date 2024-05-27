<!--- Check to see if the user is logged in --->

<!--- EX_thisTagHasEndTag.cfm --->


<cflogin>

    <cfdump  var="#thisTag#">
    <cfif thisTag.HasendTag>
        <!--- If this tag is called as a paired tag and the user is not logged in,
        exit the tag now to prevent execution of any code between the start and
        end tags. --->
        <cfexit method="exitTag">
    <cfelse>
        <!--- If this tag is not called as a paired tag and the user is not logged
        in, redirect to the login form. --->
     <!---    <cflocation url="#application.urlRoot#/login/LoginForm.cfm" addtoken="No"> --->
           
            <cfdump  var="nao ´r hans">
    </cfif>
</cflogin>