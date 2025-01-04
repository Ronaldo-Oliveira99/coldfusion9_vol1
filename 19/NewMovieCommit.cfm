<!--- 
 Filename: NewMovieCommit.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Inserts new movie and associated records into 
 database. Gets called by NewMovieWizard.cfm 
--->


<!--- Insert film record --->
<cfquery result='r'>
  INSERT INTO Films(
    MovieTitle, 
    PitchText, 
    RatingID)
  VALUES (
    <cfqueryparam cfsqltype='cf_sql_varchar'
    value='#SESSION.MovWiz.MovieTitle#'>,
    <cfqueryparam cfsqltype='cf_sql_varchar' 
    value='#SESSION.MovWiz.PitchText#'>,
    <cfqueryparam cfsqltype='cf_sql_integer'
    value='#SESSION.MovWiz.RatingID#'> 
    )
</cfquery>
  <!--- when using the result attribute, you can get the ID of 
  the last inserted record. --->
<cfset newId = r.generatedKey>

<!--- Insert director record --->
<cfquery >
  INSERT INTO FilmsDirectors(FilmID, DirectorID, Salary)
  VALUES (
          <cfqueryparam cfsqltype='cf_sql_integer' value='#newID#'>, 
          <cfqueryparam cfsqltype='cf_sql_integer' value='#session.MovWiz.DirectorID#'>,
          0
          )
</cfquery>

<!--- Insert actor records --->
<cfloop list='#session.movWiz.actorIDs#' index='thisActor'>
  <cfset isStar = thisActor eq session.movWiz.starActorId?1:0>
  <cfquery datasource='ows_oracle'>
      INSERT INTO FilmsActors(FilmID, ActorID, Salary, IsStarringRole)
      VALUES (
      <cfqueryparam cfsqltype='cf_sql_integer' value='#newID#'>,
      <cfqueryparam cfsqltype='cf_sql_integer' value='#thisActor#'>,
      0,
      <cfqueryparam cfsqltype='cf_sql_bit' value='#isStar#'>
      )
  </cfquery>
</cfloop>


<!--- Remove MovWiz variable from SESSION structure --->
<!--- User will be started over on return to wizard --->
<cfset structDelete(session, 'movWiz')>


<!--- Display message to user --->
<html>
<head><title>Movie Added</title></head>
<body>
  <h2>Movie Added</h2>
  <p>The movie has been added to the database.</p>

  <!--- Link to go through the wizard again --->
  <p><a href='NewMovieWizard.cfm'>Enter Another Movie</a></p>

</body>
</html>
