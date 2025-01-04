<cfcomponent <!---output='false'persistent="true"  table="art_Records" --->>
   <cfset this.name = "app4">
   <cfset this.datasource = "ows">
   <cfset this.ormenabled = true>
  <!---  <cfset this.ormsettings ={
       <!--- dbcreate = "update",
       logsql = true,
       flushAtRequestEnd = false,
       autoManageSession = true,
       eventHandling = true, --->
       cfclocation = "model"
   }> --->

   <cffunction name="onApplicationStart" output="false" returnType="void">

       <!--- Any variables set here can be used by all our pages --->
       <cfset APPLICATION.dataSource = "ows">
       <cfset APPLICATION.companyName = "Orange Whip Studios">
     
    </cffunction>

    <cffunction name='onRequestStart' returntype='boolean'>
        <cfset var result=TRUE>
        <!--- Reset if needed --->
        <cfif IsDefined('URL.reset')>
            <cfset onApplicationStart()>
        </cfif>		
        <cfreturn result>
    </cffunction>

 </cfcomponent>
