<cfcomponent rest="true" restpath="APIroutes">
    
    <cffunction name="sayHello" access="remote" returntype="any" httpmethod="GET">
    <cfargument name="json" required="no" type="string" default="myjson" hint="Teste requisicoes">
    
        <cfset rest = "Hello World">
        
        <cfreturn arguments.json >
        <cfreturn rest >

    </cffunction>
</cfcomponent>