<!--- 
 Filename: Application2.cfc
 Created by: Raymond Camden (ray@camdenfamily.com)
 Please Note: Executes for every page request
--->

<cfcomponent output='false'>

  <!--- Name the application. --->
  <cfset this.name='OrangeWhipSite'>
  <!--- Turn on session management. --->
  <cfset this.sessionManagement=true>
  <!--- Default datasource --->   
  <cfset this.dataSource='ows'>  

  <cffunction name='onApplicationStart' output='false' returnType='void'>

    <!--- Any variables set here can be used by all our pages --->
    <cfset application.companyName = 'Orange Whip Studios'>
  
  </cffunction>

  <cffunction name='onRequestStart' output='false' returnType='void'>
  
    <cfinclude template='ForceUserLogin.cfm'>
    
  </cffunction>
  
</cfcomponent>