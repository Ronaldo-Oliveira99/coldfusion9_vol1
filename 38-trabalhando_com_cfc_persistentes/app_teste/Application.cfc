<cfcomponent <!---output='false'persistent="true"  table="art_Records" --->>
    <cfset this.name = "testeApp">
    <cfset this.datasource = "ows_oracle">
    <cfset this.ormenabled = true>
    <cfset THIS.select_only='no'>
    <cfset this.ormsettings ={
        <!--- dbcreate = "update",
        logsql = true,
        flushAtRequestEnd = false,
        autoManageSession = true,
        eventHandling = true, --->
        cfclocation = "model"
    }>
 
    <cffunction name='onApplicationStart'>
		<!--- To prompt for data source set this to 'yes'> --->
		<cfset APPLICATION.datasource_prompt='no'>
		<!--- Specify a default data source --->
		<cfset APPLICATION.datasource_default="ows_oracle">
		<!--- Set SELECT ONLY flag --->
		<cfset APPLICATION.select_only=THIS.select_only>
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

