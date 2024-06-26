<!--- 
 Filename: FeaturedMovie.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Displays a single movie on the page, on a rotating basis
 Please Note Application variables must be enabled
--->

<!--- List of movies to show (list starts out empty) --->
<cfparam name='application.movieList' type='string' default=''>

<!--- If this is the first time we're running this, --->
<!--- Or we have run out of movies to rotate through --->
<cfif listLen(application.movieList) eq 0>
 <!--- Get all current FilmIDs from the database --->
 <cfquery name='getFilmIDs'>
 SELECT FilmID FROM Films
 ORDER BY MovieTitle
 </cfquery>

 <!--- Turn FilmIDs into a simple comma-separated list --->
 <cfset application.movieList = valueList(getFilmIDs.FilmID)>
</cfif>

<!--- Pick the first movie in the list to show right now --->
<cfset thisMovieID = listFirst(application.MovieList)>

<!--- <cfdump  var="#application.movieList#"><br> --->

<!--- <cfdump  var="#thisMovieID#"><br> --->

<!--- Re-save the list, as all movies *except* the first --->
<cfset application.movieList = listRest(application.movieList)>

<!--- Now that we have chosen the film to 'Feature', --->
<!--- Get all important info about it from database. --->
<!--- <cfdump  var="#application.movieList#"> --->


<cfquery name='GetFilm'>
 SELECT 
 MovieTitle, Summary, Rating, 
 AmountBudgeted, DateInTheaters
 FROM Films f, FilmsRatings r
 WHERE FilmID = 
 <cfqueryparam cfsqltype='cf_sql_integer' value='#thisMovieID#'>
 AND f.RatingID = r.RatingID
</cfquery>

<!--- Now Display Our Featured Movie --->
<cfoutput>
 <!--- Define formatting for our 'feature' display --->
 <style type='text/css'>
 TH.fm { background:RoyalBlue;color:white;text-align:left;
 font-family:sans-serif;font-size:10px} 
 TD.fm { background:LightSteelBlue;
 font-family:sans-serif;font-size:12px} 
 </style>

 <!--- Show info about featured movie in HTML Table --->
 <table width='150' align='right' border='0' cellspacing='0'>
 <tr><th class='fm'>
 Featured Film
 </th></tr>
 <!--- Movie Title, Summary, Rating --->
 <tr><td class='fm'>
 <b>#getFilm.MovieTitle#</b><br>
 #getFilm.Summary#<br>
 <p align='right'>Rated: #getFilm.Rating#</p>
 </td></tr>
 <!--- Cost (rounded to millions), release date --->
 <tr><th class='fm'>
 Production Cost $#round(getFilm.AmountBudgeted / 1000000)# Million<br>
 In Theaters #dateFormat(getFilm.DateInTheaters, 'mmmm d')#<br>
 </th></tr>
 </table>
 <br clear='all'>
</cfoutput>
