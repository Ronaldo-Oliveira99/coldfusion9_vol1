<!--- 
 Filename: Application7.cfc (The 'Application Component')
 Created by: Raymond Camden (ray@camdenfamily.com)
 Purpose: Sets 'constant' variables and includes consistent header
--->

<cfcomponent output='false'>

  <cfset this.name = 'ows19'>
  <cfset this.dataSource = "ows_oracle">

  <cferror type='Request' template='ErrorRequest.cfm' 
           mailto='webmaster@orangewhipstudios.com'>
  <cferror type='Exception' template='ErrorException.cfm' 
           mailto='webmaster@orangewhipstudios.com'>

  <cffunction name='onApplicationStart' returnType='boolean' output='false'>
    <!--- When did the application start? --->
    <cfset application.appStarted = now()>

    <cfreturn true>
  </cffunction>

  <cffunction name='onApplicationEnd' returnType='void' output='false'>
    <cfargument name='appScope' required='true'> 

    <!--- Log how many minutes the application stayed alive --->
    <cflog file='#this.name#' text=
'App ended after #dateDiff('n',arguments.appScope.appStarted,now())# minutes.'>

  </cffunction>
  
<cffunction name='onRequestStart' returnType='boolean' output='true'>
    <!--- Any variables set here can be used by all our pages --->
    <cfset request.companyName = 'Orange Whip Studios'>
    <cfset request.datasource  = this.dataSource >

    <!--- Display our Site Header at top of every page --->
    <cfif not isDefined('url.print')>
      <cfinclude template='SiteHeader.cfm'>
    </cfif>
    
    <cfreturn true>
  </cffunction>

  <cffunction name='onRequestEnd' returnType='void' output='true'>

    <!--- Display our Site Footer at bottom of every page --->
    <cfif not isDefined('url.print')>
      <cfinclude template='SiteFooter.cfm'>
    </cfif>
    
  </cffunction>

  <cffunction name='onRequest' returnType='void' outout='true'>
    <cfargument name='targetPage' type='string' required='true'>
    <cfset var content = ''>

   <!---  <cfdump  var="#arguments#"> --->
      
    <cfif not isDefined('url.print')>
      <cfinclude template='#arguments.targetPage#'>
    <cfelse>
      <!--- Show the Print version --->
      <!--- First we let the file run and save the result --->
      <cfsavecontent variable='content'>
        <cfinclude template='#arguments.targetPage#'>
      </cfsavecontent>
      
      <!--- Remove HTML --->
      <cfset content = reReplace(content,'<.*?>','','all')>
      <cfoutput><pre>#content#</pre></cfoutput>

    </cfif>  
  </cffunction>

  <cffunction name='onError' returnType='void' output='false'>
    <cfargument name='exception' required='true'>
    <cfargument name='eventName' type='string' required='true'>
    
    <!--- Use the cflog tag to record info on the error --->
    <cfif arguments.eventName is ''>
      <cflog file='#this.name#' type='error' 
             text='#arguments.exception.message#'>
    <cfelse>
      <cflog file='#this.name#' type='error'
 text='Error in Method [#arguments.eventName#] #arguments.exception.message#'>
     </cfif>
     
     <!--- Let the <cferror> tags do their job. --->
     <cfthrow object='#arguments.exception#'>
                 
  </cffunction>


  <cffunction name='onMissingTemplate' returnType='boolean' output='false'>
    <cfargument name='targetpage' type='string' required='true'>
	
    <!--- log it --->
    <cflog file='#this.name#' text='Missing Template: #arguments.targetpage#'>
    <cflocation url='404.cfm?missingtemplate=#urlEncodedFormat(arguments.targetpage)#' addToken='false'>
	
</cffunction>
    
</cfcomponent>
