 <!---
getMetaData.cfm 
Demonstrate use of getMetaData() function ---> 
<!--- instantiate the FilmSearchCFC object into cfcFilmSearch---> 
<cfset cfcFilmSearch = new FilmSearchCFC()> 


<!--- now get the metadata, into the ourMetaData function---> 
<cfset ourMetaData = getMetaData(cfcFilmSearch)>
<cfoutput> 
    <!--- Show the displayName and size; we could also show the hint, 
    path, etc.---> 
    <h3>Welcome to the #ourMetaData.Name#!</h3> 
        Enjoy our #arrayLen(ourMetaData.functions)# functions: 
    <ul> 
        <!--- loop through and show each function?s name and hint; could also show 
        parameters array, etc. but let?s keep it simple.---> 
        <cfloop index="thisFunction" from="1" to="#arrayLen(ourMetaData.functions)#"> 
            <li>#ourMetaData.functions[thisFunction].Name#- #ourMetaData.functions[thisFunction].Hint#</li> 
        </cfloop> 
    </ul> 
</cfoutput>

<!--- <cfdump  var="#ourMetaData#"> --->
