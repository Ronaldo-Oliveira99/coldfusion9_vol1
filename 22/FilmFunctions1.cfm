 <!---
 Filename: FilmFunctions1.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Creates a library of user-defined functions
 related to films--->
 <!--- Function: GetFilmTitle() ---> 
<!--- Returns the title of a film, based on FilmID --->
 <cffunction name="getFilmTitle">
    <!--- One argument: FilmID --->
    <cfargument name="filmID" type="numeric" required="Yes">
    <!--- This variable is for this function?s use only --->
    <cfset var getFilm = "">
    <!--- Get the film?s title --->
    <cfquery name="getFilm" datasource="ows" cachedwithin="#createTimespan(0,1,0,0)#">
        SELECT MovieTitle FROM Films
        WHERE FilmID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.filmID#">
    </cfquery>
    <!--- Return the film?s title --->
    <cfreturn getFilm.MovieTitle>
 </cffunction>