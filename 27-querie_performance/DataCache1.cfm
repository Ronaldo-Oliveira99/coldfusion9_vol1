<!--- 
 Filename: DataCache1.cfm
 Author: Raymond Camden (RKC)
 Purpose: Demonstrates use of partial page caching
--->

<cfcache action="get" id="films" name="films">
    <cfif isNull(films)>
        <cfset sleep(2000)>
            <cfquery name="films" datasource="ows">
                SELECT FilmID, MovieTitle FROM Films
            </cfquery>
        <cfcache action="put" id="films" value="#films#">
    </cfif>
<cfoutput query="films">
    #movietitle#<br/>
</cfoutput>
