 <!---
 Filename: FilmList.cfm
 Created by: Nate Weiss (NMW)
 Please Note Displays a list of films--->
 <!--- Function: getFilmTitle() ---> 
<!--- Returns the title of a film, based on FilmID --->
<cffunction name='getFilmTitle'>
    <!--- One argument: FilmID --->
    <cfargument name='filmID' type='numeric' required='Yes'>
    <!--- This variable is for this function?s use only --->
    <cfset var getFilm = ''>
    <!--- Get the film?s title --->
    <cfquery name='getFilm' datasource='ows' cachedwithin='#createTimespan(0,1,0,0)#'>
        SELECT MovieTitle FROM Films
        WHERE FilmID = <cfqueryparam cfsqltype='cf_sql_integer' value='#arguments.filmID#'>
    </cfquery>
    <!--- Return the film?s title --->
    <cfreturn getFilm.MovieTitle>
</cffunction>
    <!--- Get a list of all FilmIDs --->
    <cfquery name='getFilms' datasource='ows'>
        SELECT FilmID
        FROM Films
    </cfquery>
<html> 

<head><title>Film List</title></head>
    <body>
        <h3>Here is the current list of Orange Whip Studios films:</h3>
        <!--- Now it is extremely easy to display a list of film links --->
        <cfoutput query='getFilms'>
            #getFilmTitle(FilmID)#<br>
        </cfoutput>
    </body>
</html>