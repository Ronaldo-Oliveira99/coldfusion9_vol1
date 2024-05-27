<!---
 Filename: UsingPickFeaturedMovie1.cfm
 Author: Nate Weiss (NMW)
 Purpose: Shows how <cf_PickFeaturedMovie> can be used in a ColdFusion page
--->

<!--- Page Title and Text Message --->
<h2>Movie Display Demonstration</h2>
<!--- Pick rotating Featured Movie to show, via Custom Tag --->
<cf_PickFeaturedMovie>
<cfdump  var="#featuredFilmID#">

<cf_PickFeaturedMovie2
returnvariable="showThisMovieIDsss"
returnvariable2="showThisMovieIDsss">
<cfdump  var="#showThisMovieIDsss#">

<!--- <cfoutput>
    #featuredFilmID#
</cfoutput> --->

<!--- <cfset mylist = '1,2,3,4,5'>
<cfset teste = listRest(mylist) > --->

<!--- <br><cfdump  var="#session.movieList#"><br>
<cfdump  var="#teste#"><br> --->
<!--- Display Film info as ?callout", via Custom Tag --->
<cf_ShowMovieCallout
filmID="#featuredFilmID#">

<!--- utilizando estilo JPS java pages --->
<cfimport taglib="mylib" prefix="lib">

 <lib:IntelligentForm formName="MyForm">
  <lib:IntelligentInput fieldName="SSN" size="12" maxLength="11"/>
  <lib:IntelligentInput fieldName="FirstName" size="22" maxLength="20"/>
  <lib:IntelligentInput fieldName="LastNames" size="22" maxLength="20"/>
 </lib:IntelligentForm>


 <lib:IntelligentForm formName="MyForm2">
  <lib:IntelligentInput fieldName="EMPRESA" size="12" maxLength="11"/>
  <lib:IntelligentInput fieldName="NOME" size="22" maxLength="20"/>
  <lib:IntelligentInput fieldName="SBRENOME" size="22" maxLength="20"/>
 </lib:IntelligentForm>

 <cf_Truncatequote numberOfCharacters="400">
    Four score and seven years ago our fathers brought forth on this continent a new 
   nation, conceived in liberty and dedicated to the proposition that all men are 
   created equal. Now we are engaged in a great civil war, testing whether that nation 
   or any nation so conceived and so dedicated can long endure. We are met on a great 
   battlefield of that war. We have come to dedicate a portion of that field as a final 
   resting-place for those who here gave their lives that that nation might live. It is 
   altogether fitting and proper that we should do this. 
</cf_Truncatequote>


<cf_EX_thisTagHasEndTag>

    
<cf_Auth>

</cf_Auth>
