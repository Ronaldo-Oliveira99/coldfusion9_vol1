 <!---
 Filename: FilmList2.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Displays a list of films --->


 <!--- Include the set of film-related user-defined functions --->
 <cfinclude template="FilmFunctions1.cfm">

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