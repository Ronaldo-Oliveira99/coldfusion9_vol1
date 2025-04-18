<!---
Module: index.cfm      
Author:  Raymond Camden     
Function: List directors so you can add/edit/delete.
--->

<cfif structKeyExists(url, "delete")>
    <cfset directorToDie = entityLoadByPk("director", url.delete)>
    <cfset entityDelete(directorToDie)>
    <!--- <cflocation url="index.cfm" addToken="false"> --->
    <cfset  ormFlush()>
</cfif>
<cfset directors = entityLoad("director", {},  "lastname asc, firstname asc")>
<h2>Directors</h2>
<table border="1">
    <cfloop index="d" array="#directors#">
        <cfoutput>
            <tr>
                <td><a href="edit.cfm?id=#d.getDirectorid()#">#d.getLastName()#, 
                    #d.getFirstName()#</a></td>
                <td><a href="index.cfm?delete=#d.getDirectorid()#">Delete</a></td>
            </tr>
        </cfoutput>
    </cfloop>
</table>
<a href="edit.cfm">Add New Director</a>