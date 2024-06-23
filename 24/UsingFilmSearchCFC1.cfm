<!--- 
 Filename: UsingFilmSearchCFC1.cfm
 Author: Nate Weiss (NMW)
 Purpose: Uses the FilmSearchCFC component to display a list of films
--->

<html>
<head><title>Film Search Example</title></head>
<body>

    <!--- Invoke the ListFilms() method of the FilmSearchComponent --->
    <cfparam name="FORM.keywords" default="ColdFusion">
    
    <cfset cfcFilmSearch = new FilmSearchCFC() >
    <cfset filmsQuery = cfcFilmSearch.listFilms(searchString=FORM.keywords)>
    
    <!--- Now output the list of films --->
    <cfoutput  query="filmsQuery">
        #FilmsQuery.MovieTitle#<br>
    </cfoutput>
    
    <cfinvoke 
        component="FilmSearchCFC" 
        method="listFilms" 
        searchString="#FORM.keywords#"
        returnVariable="FilmsQuery2"
    >

    <cfoutput query="FilmsQuery2">
        #FilmsQuery2.MovieTitle#<br>
    </cfoutput>




    <cfobject component="FilmSearchCFC" name="cfcFilmRotation"> 
    <cfobject component="FilmSearchCFC" name="cfcFilmSearch2"> 
   <!---  <cfdump var="#cfcFilmRotation#">
    <cfdump var="#cfcFilmSearch#">
    <cfdump var='#getMetaData(cfcFilmSearch2)#'> --->


    <!--- Acessando um CFC por meio de um formulário --->

    <cfform action="FilmSearchCFC.cfc?method=PrintFilms"> 
        <input name="searchString"> 
        <input type="Submit" value="Search"> 
    </cfform>


</body>
</html>
