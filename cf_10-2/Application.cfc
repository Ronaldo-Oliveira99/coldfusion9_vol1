
<cfcomponent>
    <cfset this.name = "cfwack2_1">
    <!--- <cfset this.wschannels = [{name:"news"}]> --->
    <!--- <cfset this.websocket.channels = ["news"]> --->
    <cfset this.wschannels = [{name:"news",cfclistener:"newsHandler"}]>
</cfcomponent>

