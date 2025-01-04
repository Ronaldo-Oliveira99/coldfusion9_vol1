<!--- 
 Filename:   Application.cfc
 Created by:  Raymond Camden (ray@camdenfamily.com)
 Please Note: Executes for every page request!
--->

<cfcomponent output="false">

  <!--- Name the application. --->
  <cfset this.name = "c34">
  <cfset this.sessionManagement=true>
  
  <cffunction name="onApplicationStart" returnType="void" 
			  output="false">
    <cfset APPLICATION.datasource="ows_oracle">
  </cffunction>  

</cfcomponent>