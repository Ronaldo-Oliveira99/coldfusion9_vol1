<!--- 
 Filename:   Application.cfc
 Created by:  Raymond Camden (ray@camdenfamily.com)
 Please Note: Executes for every page request!
--->

<cfcomponent output="false">

  <!--- Name the application. --->
  <cfset this.name = "c51">
  <cfset this.sessionManagement=true>
  
  <cffunction name="onApplicationStart" returnType="void" output="false">
    <cfset APPLICATION.dataSource="ows">
  </cffunction>  

</cfcomponent>