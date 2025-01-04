<!--- 
 Filename: ChoicePage6.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Provides navigation elements for films and ratings
--->

<html>
<head><title>Films</title></head>
<body>
<h2>Film Information</h2>

<cftry>
  <!--- Location of our emergency backup file --->
  <cfset backupFilePath = expandPath("FilmsBackup.xml")>
  
  <!--- Retrieve Films from live database --->
  <cfquery name="getFilms" datasource="#APPLICATION.dataSource#">
  SELECT FilmID, MovieTitle
  FROM Films
  ORDER BY Films.MovieTitle
  </cfquery>
  
  <!--- Now weÕll make sure that our backup file exists --->
  <!--- If it doesnÕt exist yet, weÕll try to create it --->
  <!--- Also, re-create it whenever server is restarted --->
  <cftry>
  <!--- If the server has just been restarted, or --->
  <!--- if the backup file has never been created --->
  <cfif not isDefined("APPLICATION.getFilmsBackupCreated") 
  or not fileExists(backupFilePath)>
  
    <!--- Convert the query to WDDX (an XML vocabulary) --->
    <cfwddx action="CFML2WDDX" input="#getFilms#" output="wddxPacket">
    
    <!--- Save the XML on serverÕs drive, as our backup file ---> 
    <cffile action="write" file="#backupFilePath#" output="#wddxPacket#"> 
    
    <!--- Remember that we just created the emergency file ---> 
    <!--- This will be forgotten when server is restarted; thus, backup --->
    <!--- file will be refreshed on first successful query after restart --->
    <cfset APPLICATION.getFilmsBackupCreated = True> 
  </cfif>

  <!--- Silently ignore any errors while creating backup file --->
  <!--- (the worst that happens is the backup file doesnÕt get made) --->
  <cfcatch TYPE="Any"/> 
  </cftry> 
 
  <!--- If any database errors occur during above query, --->
  <cfcatch type="Database">
 
    <!--- Unless this is SQL Error XJ004, un-catch the exception --->
    <cfif CFCATCH.SQLState neq "XJ004">
      <cfrethrow>    
    <!--- If itÕs SQL Error, XJ004, attempt to get data from txt file --->
    <cfelse>
      <cftry>

      <!--- Read contents of the WDDX/XML in from backup file --->
      <cffile action="read" file="#backupFilePath#" variable="wddxPacket">
      
      <!--- Convert the XML back into original query object ---> 
      <cfwddx action="WDDX2CFML" input="#wddxPacket#" output="getFilms"> 
 
       <!--- Let user know that emergency version is being used --->
       <p><i>NOTE: 
       We are not able to connect to our real-time Films database at the 
       moment. Instead, we are using data from our archives to display 
       the Films list. Please try again later today for an up to date 
       listing.</i></p> 
 
      <!--- If any problems occur while trying to use the backup file --->
      <cfcatch type="Any">
        <!--- Let user know that the Films data canÕt be shown right now --->
        <i>Sorry, we are not able to provide you with a list of films.</i><br>
      </cfcatch>
      </cftry>

    </cfif>
  </cfcatch>
</cftry>

<!--- Attempt database operation --->
<cftry>

  <!--- Retrieve Ratings from database --->
  <cfquery name="getRatings" datasource="#APPLICATION.dataSource#">
  SELECT RatingID, Rating
  FROM FilmsRatings
  ORDER BY Rating
  </cfquery> 
 
  <!--- Silently catch any database errors from above query --->
  <cfcatch type="Database"/>
</cftry>

 
<!--- Create self-submitting form --->
<cfform action="#CGI.script_name#" method="post">

  <!--- If, after all is said and done, we were able to get Film data --->
  <cfif isDefined("getFilms")>
    <!--- Display Film names in a drop-down list --->
    <p>Films:
    <cfselect query="getFilms" name="filmID" value="FilmID" display="MovieTitle"/>
    <cfinput type="submit" name="go" value="Go">
  </cfif>
 
  <!--- If, after all is said and done, we were able to get Ratings data --->
  <cfif isDefined("getRatings")>
    <!--- Display Ratings in a drop-down list --->
    <p>Ratings:
    <cfselect query="getRatings" name="ratingID"
    value="RatingID" display="Rating"/>
    <cfinput type="submit" name="go" value="Go">
  </cfif> 

</cfform>

</body>
</html>
