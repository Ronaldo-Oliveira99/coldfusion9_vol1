<cfcomponent <!---output='false'persistent="true"  table="art_Records" --->>
    <cfset this.name = "MinhaAplicacao">
    <cfset this.datasource = "ows_oracle">
    <cfset this.ormenabled = true>
    <cfset this.ormsettings ={
        <!--- dbcreate = "update",
        logsql = true,
        flushAtRequestEnd = false,
        autoManageSession = true,
        eventHandling = true, --->
        cfclocation = "model"
    }>
 
    <cffunction name="onApplicationStart" output="false" returnType="void">

        <!--- Any variables set here can be used by all our pages --->
        <cfset APPLICATION.dataSource = "ows_oracle">
        <cfset APPLICATION.companyName = "Orange Whip Studios">
      
      </cffunction>
 
  </cfcomponent>

