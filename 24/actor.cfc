<!--- 
  actor.cfc
  Component that contains an actor, inheriting from person
  Modified by Ken Fricklas (kenf@fricklas.com)
  Modified: 8/1/2007
  Code from Listing 27.3
--->
<cfcomponent displayName="actor" extends="person">
<!---   <cfset THIS.firstName = "Judi">
  <cfset THIS.lastName = "Dents"> --->

<cffunction name="init" returntype="component">
  <cfargument name="datasource" required="yes" type="string">
  <cfset variables.dsn = arguments.datasource>
  <cfreturn this>
</cffunction>

<!--- <cffunction name="showDetail" output="true">
  Star of the hit <EM>The Importance of Being Sternest</EM>.
</cffunction> --->

<!--- Demonstrate roles --->
<cffunction name="getActorSalary" returnType="query" roles="Producers,Executives">
  <cfargument name="actorID" type="numeric" required="true" 
              displayName="Actor ID" hint="The ID of the Actor">

  <cfquery name="salaries" dataSource="#variables.dsn#">
    SELECT Actors.ActorID, Actors.NameFirst, Actors.NameLast, 
      FilmsActors.Salary, Films.MovieTitle
    FROM Films 
    INNER JOIN (Actors INNER JOIN FilmsActors 
      ON Actors.ActorID = FilmsActors.ActorID) 
      ON Films.FilmID = FilmsActors.FilmID
    WHERE Actors.ActorID = #Arguments.actorID#
  </cfquery>
  <cfreturn salaries>
</cffunction>

</cfcomponent>
