<!--- 
 Filename: FilmSearchCFC.cfc
 Author: Nate Weiss (NMW)
 Purpose: Creates FilmSearchCFC, a simple ColdFusion Component
--->

<!--- The <CFCOMPONENT> block defines the CFC --->
<!--- The filename of this file determines the CFCÕs name --->
<cfcomponent output="false">

  <!--- ListFilms() method --->
  <cffunction name="listFilms" returnType="query" output="false">
    <!--- Optional SearchString argument ---> 
    <cfargument name="searchString" required="no" default="">

    <!--- var scoped variables --->
    <cfset var getFilms = "">
    <!--- Run the query ---> 
    <cfquery name="getFilms" datasource="ows">
    SELECT FilmID, MovieTitle FROM Films
    <!--- If a search string has been specified --->
    <cfif ARGUMENTS.searchString neq "">
    WHERE (MovieTitle LIKE '%#ARGUMENTS.searchString#%'
    OR Summary LIKE '%#ARGUMENTS.searchString#%')
    </cfif>
    ORDER BY MovieTitle
    </cfquery>
    
    <!--- Return the query results ---> 
    <cfreturn getFilms>
  
  </cffunction>

</cfcomponent>
