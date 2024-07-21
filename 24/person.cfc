<!--- 
  person.cfc
  Component that contains a “person", firstname and lastname only
  Modified by Ken Fricklas (kenf@fricklas.com)
  Modified: 8/1/2007
  Code from Listing 27.3
--->
<cfcomponent displayName="Person" hint="Parent Component - Person">

<cfparam name="THIS.firstName" default="John">
<cfparam name="THIS.lastName" default="Doe">

<cffunction name="showPerson" output="true" hint="showPerson in person.cfc">
  <!--- <cfargument name="showDetail" required="false" type="boolean" default="false"> --->
    <B>#THIS.firstName# #THIS.lastName#</B>
    <!--- <cfif arguments.showDetail>
      <BR>#THIS.showDetail()#
    </cfif> --->
</cffunction>

</cfcomponent>
