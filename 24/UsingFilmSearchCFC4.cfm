<!--- 
 Filename: UsingFilmSearchCFC4.cfm
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

<!--- Create an instance of the CFC --->
<cfobject component="FilmSearchCFC" name="myFilmSearcher">
 
<!--- Invoke the CFCÕs ListFilms() method --->
<cfset filmsQuery = myFilmSearcher.listFilms(FORM.keywords)>
 
<!--- Now output the list of films --->
<cfoutput query="filmsQuery">
 #filmsQuery.MovieTitle#<br>
</cfoutput>

</body>
</html>
