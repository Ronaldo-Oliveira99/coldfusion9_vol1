<!---
Name:        movie_delete.cfm
Author:      Ben Forta (ben@forta.com)
Description: Delete a movie
Created:     01/01/2010
--->

<!--- Check that FilmID was provided --->
<cfif NOT IsDefined('FilmID')>
 <h1>You did not specify the FilmID</h1>
 <cfabort>
</cfif>

<!--- Delete a movie --->
<cfinvoke component='movies'
          method='delete'
          filmid='#URL.FilmID#'>

<!--- When done go back to movie list --->
<cflocation url='movies.cfm'>
