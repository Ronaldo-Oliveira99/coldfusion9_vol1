<!--- 
 Filename: FilmSearchCFC.cfc
 Author: Nate Weiss (NMW)
 Purpose: Creates FilmSearchCFC, a simple ColdFusion Component
--->
<!--- The <CFCOMPONENT> block defines the CFC --->
<!--- The filename of this file determines the CFC�s name --->
<cfcomponent output="yes"  hint="Search and display films">

  <!--- ListFilms() method --->
  <cffunction name="listFilms" returnType="query" output="yes"  access="remote" hint="Search for a film, and return a query with the id and title of the matching films.">
    <!--- Optional SearchString argument ---> 
    <cfargument name="searchString" required="no" default=""  hint="movie title to
    search for. If not provided, returns all films.">

    <!--- var scoped variables --->
    <cfset var getFilms = "">
    <!--- Run the query ---> 

    <cfquery name="getFilms" datasource="ows_oracle">
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

  <cffunction name="listFilms_json" returnType="query" returnFormat="JSON" output="false"  access="remote" hint="Search for a film, and return a query with the id and title of the matching films.">
    <!--- Optional SearchString argument ---> 
    <cfargument name="searchString" required="no" default=""  hint="movie title to
    search for. If not provided, returns all films.">

    <!--- var scoped variables --->
    <cfset var getFilms = "">
    <!--- Run the query ---> 

    <cfquery name="getFilms" datasource="ows_oracle">
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

  <cffunction name="printFilms" returnType="void" output="yes" access="remote" hint="Search for a film, and display the results in an HTML table."> 
    <cfargument name="searchString" required="no" default="" hint="Movie title to search for. If not provided, returns all films."> 
    <!--- call the local function getFilms with the argument searchString---> 
    <cfdump  var="#form#">
    
    <cfset var qFilms = listFilms(arguments.searchString)> 
    <table> 
      <tr>
        <th>ID</th>
        <th>Title</th>
      </tr> 
      <cfoutput query="qFilms"> 
        <tr>
          <td>#qFilms.FilmID#</td>
          <td>#qFilms.MovieTitle#</td>+
        </tr> 
      </cfoutput> 
    </table> 
    <!--- Return the query results---> 
    <cfreturn> 
 </cffunction> 

 <cffunction name="teste_cfwddx" returnType="void" output="yes" access="remote" hint="Search for a film, and display the results in an HTML table."> 
  <cfargument name="searchString" required="no" default="" hint="Movie title to search for. If not provided, returns all films."> 
  <!--- call the local function getFilms with the argument searchString---> 
  <cfset var q = listFilms(arguments.searchString)> 

  The recordset data is:...
  <p>
  <cfoutput query = q>
    #q.FilmID# #q.MovieTitle# <br>
  </cfoutput>
  <p>

  <!--- Serialize data to WDDX format. --->
  Serializing CFML data...
  <p>
  <cfwddx action = "cfml2wddx" input = #q# output = "wddxText">
  <!--- Display WDDX XML packet. --->
  Resulting WDDX packet is:
  <xmp>
    <cfoutput>
      #wddxText#
    </cfoutput>
  </xmp>
  <!--- Deserialize to a variable named wddxResult. --->
  Deserializing WDDX packet...<p>
    <cfwddx action = "wddx2cfml" input = #wddxText# output = "qnew">
  The recordset data is:...<p>
    <cfoutput query = qnew>
      #q.FilmID# #q.MovieTitle#<br>
    </cfoutput><p>
  <cfreturn> 
</cffunction> 

</cfcomponent>
