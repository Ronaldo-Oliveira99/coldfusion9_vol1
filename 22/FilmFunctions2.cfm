 <!---
 Filename: FilmFunctions2.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Creates a library of user-defined functions
 related to films--->


 <!--- Function: getFilmsQuery() ---> 
<!--- Returns a query object from the Films table in the database --->
 <cffunction name="getFilmsQuery" returntype="query" output="false">
<!--- Optional argument: FilmID --->
<cfargument name="filmID" type="numeric" required="No">
    <!--- This variable is for this function?s use only --->
    <cfset var filmsQuery = "">
    <!--- Query the database for information about all films --->
    <!--- The query is cached to improve performance --->
    <cfquery name="filmsQuery" datasource="ows_oracle" cachedwithin="#createTimespan(0,1,0,0)#">
        SELECT * FROM Films
        <!--- If a FilmID argument was provided, select that film only --->
        <cfif isDefined("arguments.filmID")>
            WHERE FilmID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.filmID#">
            <!--- Otherwise, get information for all films, in alphabetical order --->
        <cfelse>
            ORDER BY MovieTitle
        </cfif>
    </cfquery>
    <!--- Return the query --->
    <cfreturn filmsQuery>
 </cffunction>

 
 <!--- Function: getFilmTitle() ---> 
<!--- Returns the title of a film, based on FilmID ---> 
<cffunction name="getFilmTitle" returnType="string" output="false">
<!--- One argument: FilmID --->
<cfargument name="filmID" type="numeric" required="Yes">
    <!--- This variable is for this function?s use only --->
    <cfset var getFilm = "">
    <!--- Get a query object of all films in the database --->
    <cfset getFilm = getFilmsQuery(arguments.filmID)>
    <!--- Return the film?s title --->
    <cfreturn getFilm.MovieTitle>
 </cffunction>


 <!--- Function: getFilmURL() ---> 
<!--- Returns the URL to a film?s detail page, based on FilmID --->
 <cffunction name="getFilmURL" returnType="string" output="false">
<!--- One argument: FilmID --->
<cfargument name="filmID" type="numeric" required="Yes">
    <!--- Return the appropriate URL --->
    <cfreturn "ShowFilm.cfm?FilmID=#arguments.filmID#">
 </cffunction>


 <!--- Include another UDF function library ---> 
<!--- This one creates the JavaScriptPopupLink() function --->
 <cfinclude template="SimpleJavaScriptFunctions.cfm">


 <!--- Function: MakeFilmPopupLink() ---> 
<!--- Returns an HTML link for a film, based on FilmID ---> 
<cffunction name="MakeFilmPopupLink" returnType="string" output="false">
<!--- One argument: FilmID --->
<cfargument name="filmID" type="numeric" required="Yes">
    <!--- Return a link for the film --->
    <cfreturn javaScriptPopupLink(getFilmURL(ARGUMENTS.filmID),
    getFilmTitle(ARGUMENTS.FilmID))>
</cffunction>
