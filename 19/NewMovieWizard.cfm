<!--- 
 Filename: NewMovieWizard.cfm
 Created by: Nate Weiss (NMW)
 Please Note Session variables must be enabled
--->

<!--- Total Number of Steps in the Wizard --->
<cfset numberOfSteps = 5>

<!--- The session.movWiz structure holds users' entries --->
<!--- as they move through wizard. Make sure it exists! --->
<cfif not isDefined('session.movWiz')>
 <!--- If structure undefined, create/initialize it --->
 <cfset session.movWiz = structNew()>
 <!--- Represents current wizard step; start at one --->
 <cfset session.movWiz.stepNum = 1>
 <!--- We will collect these from user; start blank --->
 <cfset session.movWiz.movieTitle = ''>
 <cfset session.movWiz.pitchText = ''>
 <cfset session.movWiz.directorID = ''>
 <cfset session.movWiz.ratingID = ''>
 <cfset session.movWiz.actorIDs = ''>
 <cfset session.movWiz.starActorID = ''>
</cfif>


<!--- If user just submitted MovieTitle, remember it --->
<!--- Do same for the DirectorID, Actors, and so on. --->
<cfif isDefined('form.movieTitle')>
 <cfset session.movWiz.movieTitle = form.movieTitle>
 <cfset session.movWiz.pitchText = form.pitchText>
 <cfset session.movWiz.ratingID = form.ratingID>
<cfelseif isDefined('form.directorID')>
 <cfset session.movWiz.directorID = form.directorID>
<cfelseif isDefined('form.actorID')>
 <cfset session.movWiz.actorIDs = form.actorID>
<cfelseif isDefined('form.starActorID')>
 <cfset session.movWiz.starActorID = form.starActorID>
</cfif>


<!--- If user clicked 'Back' button, go back a step --->
<cfif isDefined('form.goBack')>
 <cfset session.movWiz.stepNum = url.stepNum - 1>
<!--- If user clicked 'Next' button, go forward one --->
<cfelseif isDefined('form.goNext')>
 <cfset session.movWiz.stepNum = url.stepNum + 1>
<!--- If user clicked 'Finished' button, we're done --->
<cfelseif isDefined('form.goDone')>
 <cflocation url='NewMovieCommit.cfm'>
</cfif>


<html>
<head><title>New Movie Wizard</title></head>
<body>

<!--- Show title and current step --->
<cfoutput>
 <b>New Movie Wizard</b><br>
 Step #session.movWiz.StepNum# of #NumberOfSteps#<br>
</cfoutput>


<!--- Data Entry Form, which submits back to itself --->
<cfform 
 action='NewMovieWizard.cfm?StepNum=#session.movWiz.stepNum#' 
 method='POST'>
 
 <!--- Display the appropriate wizard step --->
 <cfswitch expression='#session.movWiz.stepNum#'>
 <!--- Step One: Movie Title --->
 <cfcase value='1'>
 <!--- Get potential film ratings from database --->
 <cfquery name='getRatings' datasource='ows'>
 SELECT RatingID, Rating
 FROM FilmsRatings
 ORDER BY RatingID
 </cfquery>
 
 <!--- Show text entry field for title --->
 What is the title of the movie?<br>
 <cfinput 
 name='MovieTitle' 
 SIZE='50'
 VALUE='#session.movWiz.MovieTitle#'>

 <!--- Show text entry field for short description --->
 <p>What is the 'pitch' or 'one-liner' for the movie?<br>
 <cfinput 
 name='pitchText' 
 size='50'
 value='#session.movWiz.pitchText#'>

 <!--- Series of radio buttons for movie rating ---> 
 <p>Please select the rating:<br>
 <cfloop query='getRatings'>
 <!--- Re-select this rating if it was previously selected --->
 <cfset isChecked = ratingID EQ session.movWiz.ratingID>
 <!--- Display radio button --->
 <cfinput 
 type='radio'
 name='ratingID'
 checked='#isChecked#'
 value='#ratingID#'><cfoutput>#rating#<br></cfoutput>
 </cfloop> 
 </cfcase> 

 <!--- Step Two: Pick Director --->
 <cfcase value='2'>
 <!--- Get list of directors from database --->
 <cfquery name='getDirectors'>
 SELECT DirectorID, FirstName || ' ' || LastName As FullName
 FROM Directors
 ORDER BY LastName
 </cfquery>
 
 <!--- Show all Directors in SELECT list --->
 <!--- Pre-select if user has chosen one --->
 Who will be directing the movie?<br>
 <cfselect
 size='#getDirectors.recordCount#'
 query='getDirectors'
 name='directorID'
 display='fullName'
 value='directorID'
 selected='#session.movWiz.directorID#'/>
 </cfcase> 

 <!--- Step Three: Pick Actors --->
 <cfcase value='3'>
 <!--- get list of actors from database --->
 <cfquery name='getActors' datasource='ows'>
 SELECT * FROM Actors
 ORDER BY NameLast
 </cfquery>

 What actors will be in the movie?<br>
 <!--- For each actor, display checkbox --->
 <cfloop query='GetActors'>
 <!--- Should checkbox be pre-checked? --->
 <cfset isChecked = listFind(session.movWiz.actorIDs, actorID)>
 <!--- Checkbox itself --->
 <cfinput 
 type='checkbox'
 name='actorID'
 value='#actorID#'
 checked='#isChecked#'>
 <!--- Actor name --->
 <cfoutput>#nameFirst# #nameLast#</cfoutput><br>
 </cfloop> 
 </cfcase> 

 <!--- Step Four: Who is the star? --->
 <cfcase value='4'>
 <cfif session.movWiz.actorIDs EQ ''>
 Please go back to the last step and choose at least one
 actor or actress to be in the movie. 
 <cfelse>
 <!--- Get actors who are in the film --->
 <cfquery name='getActors' DATASOURCE='ows'>
 SELECT * FROM Actors
 WHERE ActorID IN (#session.movWiz.ActorIDs#)
 ORDER BY NameLast
 </cfquery>
 
 Which one of the actors will get top billing?<br> 
 <!--- For each actor, display radio button --->
 <cfloop query='getActors'>
 <!--- Should radio be pre-checked? --->
 <cfset isChecked = session.movWiz.starActorID EQ actorID>
 <!--- Radio button itself --->
 <cfinput 
 type='radio'
 name='starActorID'
 value='#actorID#'
 checked='#isChecked#'>
 <!--- Actor name --->
 <cfoutput>#nameFirst# #nameLast#</cfoutput><br>
 </cfloop> 
 </cfif>
 </cfcase> 
 
 <!--- Step Five: Final Confirmation --->
 <cfcase value='5'>
 You have successfully finished the New Movie Wizard.<br>
 Click the Finish button to add the movie to the database.<br>
 Click Back if you need to change anything.<br>
 </cfcase> 
 </cfswitch>
 

 <p>
 <!--- Show Back button, unless at first step ---> 
 <cfif session.movWiz.stepNum GT 1>
 <input type='submit' name='goBack' value='&lt;&lt; Back'>
 </cfif> 
 <!--- Show Next button, unless at last step --->
 <!--- If at last step, show 'Finish' button --->
 <cfif session.movWiz.stepNum lt numberOfSteps>
 <input type='submit' name='goNext' value='Next &gt;&gt;'>
 <cfelse>
 <input type='submit' name='goDone' value='Finish'>
 </cfif>
</cfform>

</body>
</html>
