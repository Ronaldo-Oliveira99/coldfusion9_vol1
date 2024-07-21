<!--- 
 Filename: UsingFilmRotationCFCc.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates storage of CFC instances in shared memory scopes
--->

<html>
<head>
 <title>Using FilmRotationCFC</title>
</head>

<body>

<!--- If an instance of the FilmRotatorCFC component hasnÕt been created --->
<!--- yet, create a fresh instance and store it in the SESSION scope --->


<!--- <cfdump  var="#SESSION#">

<cfset teste = structDelete(SESSION,'myFilmRotator') > --->


<cfif not isDefined("SESSION.myFilmRotator")>
    <cfset SESSION.myFilmRotator = new FilmRotationCFC()>

   <!---  <cfinvoke   component="#APPLICATION.filmRotator#" 
                method="getCurrentFilmID"
                returnVariable="featuredFilmID">

    <cfset featuredFilmID = Application.filmRotator.getCurrentFilmID()> --->
    
    <!--- <cfdump  var="NAO DEFINIDO"> --->

    <!--- <cfobject component="FilmRotationCFC" name="SESSION.filmRotator"> --->
    <cfset SESSION.myFilmRotator.rotationInterval = 10> 
    
 <!--- Rotate films every ten seconds ---> 


<!--- <cfelse>
    <cfdump  var="DEFINIDO"> --->
</cfif>


<!--- <cfdump  var="#SESSION.myFilmRotator#">

<cfinvoke component="FilmRotationCFC" method="teste_this"
 returnVariable="teste_ret">

 <cfdump  var="#teste_ret#"> --->


<!--- Display message --->
<cfoutput>
 <p>
 The callout at the right side of this page shows the currently featured film. 
 Featured films rotate every #SESSION.filmRotator.rotationInterval# seconds. 
 Just reload the page to see the next film in the sequence. 
 The sequence will not change until the web session ends.</p>
 The next film rotation will occur at: 
 #timeFormat(SESSION.filmRotator.currentUntil, "h:mm:ss tt")#
</cfoutput>
 
<!--- Show the current film in a callout, via custom tag ---> 
<cf_ShowMovieCallout filmID="#SESSION.filmRotator.getCurrentFilmID()#">

</body>
</html>
