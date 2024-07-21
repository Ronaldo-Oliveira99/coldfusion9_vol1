<!--- 
  director.cfc
  Component that contains a director, inheriting from person
  Modified by Ken Fricklas (kenf@fricklas.com)
  Modified: 8/1/2007
  Code from Listing 27.4
--->
<cfcomponent displayName="Movie Director" extends="person" implements="iCastCrew">
  <cfset THIS.firstName = "Jim">
  <cfset THIS.lastName = "Jarofmush">

  <cffunction name="showPerson" output="true" hint="showPerson in director.cfc">
  <cfargument name="showDetail" required="false" type="boolean" default="false">
     <B>A swell director</B> - #super.showPerson(true)# 
  </cffunction>
  
 <!---  <cfset THIS.credits = arrayNew(1)>
  <cfset THIS.credits[1] = "The Phantom Dentist">
  <cfset THIS.credits[2] = "Austin Showers">
  <cfset THIS.credits[3] = "Men in Slacks II"> --->

  <!--- <cffunction name="showDetail" output="true">
    Credits include:
    <UL>
    <cfloop index="i" from="1" to="#arrayLen(THIS.credits)#">
	  <LI>#THIS.credits[i]#</LI>
    </cfloop>
    </UL>
  </cffunction> --->
</cfcomponent>
