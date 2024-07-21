<!--- 
 Filename: UsingFilmRotationCFCa.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates storage of CFC instances in shared memory scopes
--->

<html>
<head>
 <title>Using FilmRotationCFC</title>
</head>

<body>

<!--- If an instance of the FilmRotatorCFC component hasnÕt been created --->
<!--- yet, create a fresh instance and store it in the APPLICATION scope --->
<cfif not isDefined("APPLICATION.filmRotator")>
   <!---  <cfset APPLICATION.FilmRotator = new FilmRotationCFC()> --->
    <cfset APPLICATION.FilmRotatorc = new FilmRotationCFCc(datasource="ows"
<!--- , rotationInterval = 5 ---> <!--- "#variables.rotationInterval#" --->)>
    <!--- <cfobject component="FilmRotationCFC" name="APPLICATION.FilmRotator"> --->
</cfif>

<!--- Invoke the GetCurrentFilmID() method of the FilmRotator CFC object --->
<!--- <cfinvoke component="#APPLICATION.filmRotator#" method="getCurrentFilmID"
 returnVariable="featuredFilmID"> --->
<cfset featuredFilmID = Application.filmRotator.getCurrentFilmID()>

<p>The callout at the right side of this page shows the currently featured film. 
The featured film changes every five seconds. </p>
<p>Just reload the page to see the next film in the sequence. 
The sequence will not change until the ColdFusion server is restarted.</p> 
 
<!--- Show the current film in a callout, via custom tag ---> 
<cf_ShowMovieCallout
 filmID="#featuredFilmID#">

</body>
</html>
