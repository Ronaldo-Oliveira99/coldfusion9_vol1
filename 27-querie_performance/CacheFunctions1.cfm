<!--- 
 Filename: CacheFunctions1.cfm
 Author: Raymond Camden (RKC)
 Purpose: Demonstrates use of cache functions
--->

<cfset films = cacheGet("films")>

<cfif isNull(films)>
   <cfset sleep(2000)>
    <cfquery name="films" datasource="ows_oracle">
        SELECT FilmID, MovieTitle FROM Films
    </cfquery>
   <cfset cachePut("films",films)>
</cfif>

<cfoutput query="films">
    #movietitle#<br/>
</cfoutput>