<!---
 Filename: Application4.cfc
 Created by: Raymond Camden (ray@camdenfamily.com)
 Handles application events.
--->

<cfcomponent output='false'>

  <cfset this.name='OrangeWhipSite_c20'>

  <!--- sessionManagement : habilita variaveis de sess�o --->
  <cfset this.sessionManagement=true>
  <cfset this.clientManagement=true>
  
  <cfset this.sessiontimeout = createtimespan(0,0,0,10)>
  
  <cffunction name='onSessionStart' returnType='void'>
    <cfset session.created = now()>
  </cffunction>
  
  <cffunction name='onSessionEnd' returnType='void'>
    <cfargument name='theSession' type='struct' required='true'>
    <cfset var duration = dateDiff('s',arguments.theSession.created,now())>
    <cflog file='#this.name#' text='Session lasted for #duration# seconds.'>
  </cffunction>
  
</cfcomponent>
