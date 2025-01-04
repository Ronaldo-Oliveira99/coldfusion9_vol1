<!--- 
 Filename: ChoicePage3c.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Provides navigation elements for films and ratings
--->

<html>
<head><title>Film Information</title></head>
<body>
<h2>Film Information</h2>

<!--- Create self-submitting form --->
<cfform action="#CGI.script_name#" method="post">

  <!--- Attempt database operation --->
  <cftry>
  <!--- Retrieve Films from database --->
  <!--- MovieTitle2 is a bad column. Remove the Ò2" to fix it. --->
  <cfquery name="getFilms" datasource="#APPLICATION.dataSource#">
  SELECT FilmID, MovieTitle2
  FROM Films
  ORDER BY Films.MovieTitle
  </cfquery>
  <!--- Display Film names in a drop-down list --->
  <p>Films:
  <cfselect query="getFilms" name="filmID" value="FilmID" 
	display="MovieTitle"/>
  <cfinput type="submit" name="go" value="Go">
  
  <!--- Silently catch any database errors from above query --->
  <cfcatch type="Database"/>
  </cftry>

  <!--- Attempt database operation --->
  <cftry>
  <!--- Retrieve Ratings from database --->
  <cfquery name="getRatings" datasource="#APPLICATION.dataSource#">
  SELECT RatingID, Rating
  FROM FilmsRatings
  ORDER BY Rating
  </cfquery> 

  <!--- Display Ratings in a drop-down list --->
  <P>Ratings:
  <cfselect query="getRatings" name="ratingID" value="RatingID" 
	display="Rating"/>
  <cfinput type="submit" name="go" value="Go">
  
  <!--- Silently catch any database errors from above query --->
  <cfcatch type="Database"/>
  </cftry>
 
</cfform>
 
</body>
</html>
