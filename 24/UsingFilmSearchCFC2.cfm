<!--- 
 Filename: UsingFilmSearchCFC2.cfm
 Author: Nate Weiss (NMW)
 Purpose: Uses the FilmSearchCFC component to display a list of films
--->

<html>
<head><title>Film Search Example</title></head>
<body>

<!--- FORM parameter called Keywords, empty by default --->
<cfparam name="FORM.keywords" default="">

<!--- Simple form to allow user to filter films --->
<cfform>
 <cfinput name="keywords" value="#FORM.keywords#">
 <input type="submit" value="Filter">
</cfform>

<!--- Invoke the ListFilms() method of the FilmSearchComponent --->
<!--- Pass the userÕs search keywords to the SearchString argument --->
<cfinvoke component="FilmSearchCFC" method="listFilms"
 searchString="#FORM.keywords#"
 returnVariable="filmsQuery">

<!--- Now output the list of films --->
<cfoutput query="filmsQuery">
 #filmsQuery.MovieTitle#<br>
</cfoutput>

</body>
</html>
