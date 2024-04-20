<!--- 
 Filename: Application.cfc
 Created by: Raymond Camden (ray@camdenfamily.com)
 Please Note Executes for every page request
--->

<cfcomponent output='false'>

  <!--- Name the application. --->
  <cfset this.name='OrangeWhipSite'>
  <!--- Turn on session management. --->
  <cfset this.sessionManagement=true>
  <!--- Default datasource --->   
  <cfset this.dataSource='ows'>     

  <cffunction name='onApplicationStart' output='false' returnType='void'>

    <cfset application.companyName = 'Orange Whip Studios'>
  
  </cffunction>

  <cffunction name='onRequestStart' output='false' returnType='void'>
  
    <!--- If user isn't logged in, force them to now ---> 
    <cfif not isDefined('session.auth.isLoggedIn')>
      <!--- If the user is now submitting 'Login' form, --->
      <!--- Include 'Login Check' code to validate user --->
      <cfif isDefined('form.UserLogin')> 
        <cfinclude template='loginCheck.cfm'>
      </cfif>

      <cfinclude template='loginForm.cfm'>
      <cfabort>
    </cfif> 

  </cffunction>
  
</cfcomponent>
