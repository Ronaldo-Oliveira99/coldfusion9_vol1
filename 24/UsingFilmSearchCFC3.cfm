<!--- 
 Filename: UsingFilmSearchCFC3.cfm
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
 
<!--- Invoke the ListFilms() method of the CFC instance --->
<cfinvoke component="#myFilmSearcher#" method="listFilms"
 returnVariable="filmsQuery">
 <!--- Pass the userÕs search keywords to the SearchString argument --->
 <cfinvokeargument name="searchString" value="#FORM.keywords#"> 
</cfinvoke> 
 
<!--- Now output the list of films --->
<cfoutput query="filmsQuery">
 #filmsQuery.MovieTitle#<br>
</cfoutput>

</body>
</html>
