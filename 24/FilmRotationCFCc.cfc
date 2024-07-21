<!---
Filename: FilmRotationCFCc.cfc
Author: Nate Weiss (NMW)
Purpose: Creates FilmRotationCFC, a ColdFusion Component
--->
<cfcomponent output="false">
  <cfproperty name="currentListPos" hint="current position in list" type="numeric">
  <cfproperty name="filmList" hint="randomized list of films" type="string">
  <cfproperty name="rotationInterval" hint="how often the film rotates, in seconds"
  type="numeric" default="5">
  <cfproperty name="currentUntil" hint="when does this film expire, and the next in
  the list becomes current" type="date">
  <!--- *** begin initialization code *** --->
  <!--- init method --->
  <cffunction name="init" returntype="component" hint="initialization">
    <cfargument name="datasource" required="yes" type="string">
    <cfargument name="rotationInterval" required="no" default="5" type="numeric">
    <cfset variables.dsn = arguments.datasource>
    <cfset THIS.rotationInterval = arguments.rotationInterval>
    <cfset THIS.filmList = randomizedFilmList()>

    <cfset THIS.currentListPos = 1>
    <cfset THIS.currentUntil = dateAdd("s", THIS.rotationInterval, now())>
  </cffunction>
<!--- *** end initialization code *** --->
<!--- Private function: RandomizedFilmList() --->
<cffunction name="randomizedFilmList" returnType="string" access="private"
output="false"
hint="For internal use. Returns a list of all Film IDs, in random order.">
<!--- This variable is for this function?s use only --->
  <cfset var getFilmIDs = "">
  <!--- Retrieve list of current films from database --->
  <cfquery name="getFilmIDs" datasource="#variables.dsn#"
  cachedwithin="#CreateTimeSpan(0,1,0,0)#">
    SELECT FilmID FROM Films
    ORDER BY MovieTitle
  </cfquery>
  <!--- Return the list of films, in random order --->
  <cfreturn listRandomize(valueList(getFilmIDs.FilmID))>
</cffunction>

<cffunction name="listRandomize" returnType="string"
  output="false"
  hint="Randomizes the order of the items in any comma-separated list.">
  
    <!--- List argument --->
    <cfargument name="list" type="string" required="Yes"
    hint="The string that you want to randomize.">
    
    <!--- These variables are for this functionÕs use only ---> 
    <cfset var result = "">
    <cfset var randPos = "">
    
    <!--- While there are items left in the original list... --->
    <cfloop condition="listLen(ARGUMENTS.list) gt 0">
      <!--- Select a list position at random --->
      <cfset randPos = randRange(1, listLen(ARGUMENTS.list))>
      <!--- Add the item at the selected position to the Result list --->
      <cfset result = listAppend(result, listGetAt(ARGUMENTS.list, randPos))>
      <!--- Remove the item from selected position of the original list --->
      <cfset ARGUMENTS.list = listDeleteAt(ARGUMENTS.list, randPos)>
    </cfloop>
    
    <!--- Return the reordered list ---> 
    <cfreturn result>
  </cffunction> 

</cfcomponent>